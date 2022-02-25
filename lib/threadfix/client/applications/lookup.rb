module Threadfix
  module Client
    module Applications
      class Lookup
        API_VERSION='v2.5.0.2'

        attr_reader :team_name, :app_name

        def initialize(options={})
          @team_name = options[:team_name]
          @app_name = options[:app_name]
        end

        def perform!
          begin
            puts "GET #{endpoint.to_s}" if ENV['DEBUG']
            r = RestClient.get(
              endpoint.to_s,
              { :accept => "application/json", :Authorization => "APIKEY #{apiKey}" }
            )
            JSON.parse(r.body)
          rescue RestClient::NotFound => e
            puts "Endpoint not found (using API version: #{API_VERSION})"
            raise e
          rescue RestClient::ExceptionWithResponse => e
            raise e
          end
        end

        private

        def endpoint
          URI("#{host}/rest/#{API_VERSION}/applications/#{team_name}/lookup?name=#{app_name}")
        end

        def host
          Client.config.host
        end

        def apiKey
          Client.config.key
        end
      end

    end
  end
end
