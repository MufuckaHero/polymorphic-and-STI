require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Blog2
  class Application < Rails::Application
    config.generators do |g|
      g.test_flamework :rspec
      g.stylesheets false
      g.javascript false
    end
  end
end