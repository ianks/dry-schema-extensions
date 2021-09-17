# frozen_string_literal: true

require "json-schema"

RSpec.describe Dry::Schema::JSON, "#open_api" do
  before do
    Dry::Schema.load_extensions(:open_api)
  end

  shared_examples "metaschema validation" do
    describe "validating against the metaschema" do
      it "produces a valid json schema document for draft1" do
        metaschema = JSON::Validator.validator_for_name("draft1").metaschema
        input = schema.respond_to?(:open_api) ? schema.open_api : schema

        JSON::Validator.validate!(metaschema, input)
      end
    end
  end

  context "when using maybe types" do
    include_examples "metaschema validation"

    subject(:schema) do
      Dry::Schema.JSON do
        required(:email).maybe(:string)
      end
    end

    it "returns the correct definition" do
      expect(schema.open_api).to eql(
        type: "object",
        properties: {
          email: {
            type: "string",
            nullable: true
          }
        },
        required: %w[email]
      )
    end
  end
end
