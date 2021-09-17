# frozen_string_literal: true

require "dry/schema/extensions/open_api/schema_compiler"

module Dry
  module Schema
    # JSONSchema extension
    #
    # @api public
    module OpenAPI
      module SchemaMethods
        # Convert the schema into a JSON schema hash
        #
        # @param [Symbol] loose Compile the schema in "loose" mode
        #
        # @return [Hash<Symbol=>Hash>]
        #
        # @api public
        def open_api(loose: false)
          compiler = SchemaCompiler.new(root: true, loose: loose)
          compiler.call(to_ast)
          compiler.to_hash
        end
      end
    end

    Processor.include(OpenAPI::SchemaMethods)
  end
end
