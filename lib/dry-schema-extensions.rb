# frozen_string_literal: true

require "dry-schema"

Dry::Schema.register_extension(:json_schema) do
  require "dry/schema/extensions/json_schema"
end

Dry::Schema.register_extension(:open_api) do
  require "dry/schema/extensions/open_api"
end
