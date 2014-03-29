require 'webmachine'
require 'webmachine/adapters/rack'
require 'hum/api/index'

module Hum

  module Api

    API ||= begin
      api = Webmachine::Application.new do | app |
        app.routes do
          add(['trace','*'], Webmachine::Trace::TraceResource)
          add ['api'], Index
        end
      end

      api.configure do | config |
        config.adapter = :Rack
      end

      api.adapter
    end

  end
end
