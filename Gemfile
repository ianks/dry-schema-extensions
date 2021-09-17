# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "dry-configurable", github: "dry-rb/dry-configurable", branch: "master" if ENV["DRY_CONFIGURABLE_FROM_MASTER"].eql?("true")
gem "dry-logic", github: "dry-rb/dry-logic", branch: "master" if ENV["DRY_LOGIC_FROM_MASTER"].eql?("true")
gem "dry-types", github: "dry-rb/dry-types", branch: "master"

group :test do
  gem "dry-monads", require: false, github: "dry-rb/dry-monads"
  gem "dry-struct", require: false, github: "dry-rb/dry-struct"
  gem "i18n", "1.8.2", require: false
  gem "json-schema"
  gem "transproc"
end

group :tools do
  gem "pry"
  gem "pry-byebug", platform: :mri
  gem "rubocop"
end
