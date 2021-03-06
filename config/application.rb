require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sapphire
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.javascripts false
      generate.stylesheets false
      generate.routing_specs false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    I18n.available_locales = %i[en pt_BR]
    I18n.default_locale = :pt_BR

    config.exceptions_app = self.routes
  end
end
