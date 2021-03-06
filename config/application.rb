require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FinalProjectThpTeambdxRtom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.assets.paths << Rails.root.join("lib", "assets", "fonts")
    config.assets.paths << Rails.root.join("lib", "assets", "images")
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w(*.svg *.eot *.woff *.ttf)
    config.action_mailer.delivery_method = :mailjet
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
