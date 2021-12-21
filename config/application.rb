require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module V1Lnclassapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    #Add whitelist Domain
    config.hosts << "www.lnclass.com"
    config.hosts << "lnclass.com"
    config.hosts << "www.main-bvxea6i-4aqgsifxsdsmw.uk-1.platformsh.site"
    config.hosts <<  "7msgbfpwdqtlhlklrdffmmddui.dbpostgres.service._.uk-1.platformsh.site"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

