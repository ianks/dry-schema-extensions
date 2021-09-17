# frozen_string_literal: true

require "dry/schema/extensions/json_schema/schema_compiler"

module Dry
  module Schema
    # @api private
    module OpenAPI
      # @api private
      class SchemaCompiler < JSONSchema::SchemaCompiler
        UnknownConversionError = Class.new(StandardError)

        def to_hash
          transform_json_schema_hash!(super)
        end

        private

        def transform_json_schema_hash!(hash)
          hash.delete(:$schema)
          transform_nullables!(hash)
        end

        def transform_nullables!(hash)
          deep_transform_values!(hash) do |input|
            next input unless input.respond_to?(:key?)
            next input unless input[:type].respond_to?(:each)

            types = input[:type]
            input[:nullable] = true if types.delete("null")

            if types.length == 1
              input[:type] = types.first
              input
            else
              raise UnknownConversionError, "cannot map type #{types.inspect}"
            end
          end
        end

        def deep_transform_values!(hash, &block)
          case hash
          when Hash
            hash.transform_values! { |value| deep_transform_values!(yield(value), &block) }
          when Array
            hash.map! { |e| deep_transform_values!(e, &block) }
          else
            yield(hash)
          end
        end
      end
    end
  end
end
