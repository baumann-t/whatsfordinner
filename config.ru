# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
Rails.application.config.hosts << "rails-production-6e9b.up.railway.app"
