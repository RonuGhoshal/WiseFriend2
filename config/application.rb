require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rspec'

Bundler.require(*Rails.groups)

module WiseFriend
  class Application < Rails::Application
    config.generators.helper = false
  end
end
