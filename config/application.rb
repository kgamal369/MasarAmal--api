require_relative "boot"

require "rails/all"
require 'active_admin'
require 'devise'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MasarAmalApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    # Use the Zeitwerk autoloader
    config.autoloader = :classic
    config.credentials = Rails.application.credentials
    config.swagger_docs = {
      'v1/swagger.json' => {
        openapi: '3.0.1',
        info: {
          title: 'Your API Documentation',
          version: 'v1',
        },
      },
    }


    # Ensure that the Devise initializer is loaded
    config.to_prepare do
      Devise::SessionsController.layout "active_admin"
    end
  end
end
