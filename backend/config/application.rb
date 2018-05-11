require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# Se ha descomentado la linea de abajo para dar solucion a un problema de carga de PDF.
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # config/application.rb
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
            headers: :any,
            methods: %I[get post options delete patch puts]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    #Configuracion de la gema delayed_job_active_record
    #Aqui indicamos a rails la queue donde se mandan los jobs
    config.active_job.queue_adapter = :delayed_job
    #modificar example.com para hacerlo funcional
    config.action_mailer.default_url_options = { host: 'example.com'}

    #Configuracion de Rack CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
  end
end
