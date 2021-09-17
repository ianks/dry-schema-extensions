# frozen_string_literal: true

begin
  require "pry-byebug"
rescue LoadError; end
SPEC_ROOT = Pathname(__dir__)

Dir[SPEC_ROOT.join("shared/**/*.rb")].sort.each(&method(:require))
Dir[SPEC_ROOT.join("support/**/*.rb")].sort.each(&method(:require))

require "dry/schema"
require "dry-schema-extensions"
require "dry/types"

Types = Dry.Types

Undefined = Dry::Core::Constants::Undefined

require "i18n"

require "dry/schema/messages/i18n"
require "dry/schema/message_set"

require "dry/configurable/test_interface"

Dry::Schema.config.enable_test_interface

RSpec.configure do |config|
  unless RUBY_VERSION >= "2.7"
    config.exclude_pattern = "**/pattern_matching_spec.rb"
  end
  config.example_status_persistence_file_path = "spec/examples.txt"

  config.before do
    stub_const("Test", Module.new)
  end

  config.before(:all) do
    Dry::Schema.config.reset_config
  end

  config.before do
    Dry::Schema.config.reset_config
  end

  config.after do
    I18n.load_path = [Dry::Schema::DEFAULT_MESSAGES_PATH]
    I18n.locale = :en
    I18n.reload!

    %i[YAML I18n].each do |backend|
      Dry::Schema::Messages.const_get(backend).instance_variable_set("@cache", nil)
    end
  end
end
