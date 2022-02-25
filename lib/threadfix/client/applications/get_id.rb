module Threadfix
  module Client
    module Applications
      class GetId
        # https://denimgroup.atlassian.net/wiki/spaces/TDOC/pages/664567813/List+Applications+-+API
        API_VERSION='v2.7.5'

        attr_reader :app_name

        def initialize(options={})
          @app_name = options[:app_name]
        end

        def perform!
          begin
            puts "GET #{endpoint.to_s}" if ENV['DEBUG']
            r = RestClient.get(
              endpoint.to_s,
              { :accept => "application/json", :Authorization => "APIKEY #{apiKey}" }
            )
            body = JSON.parse(r.body)

            begin
              body.fetch('object')
                .find{ |a| a.fetch('name').downcase == app_name.downcase}.fetch('id')
            rescue => e
              puts "App '#{app_name}' was not found."
              nil # return nil if data not found
            end
          rescue RestClient::NotFound => e
            puts "Endpoint not found (using API version: #{API_VERSION})"
            puts e.message if ENG['DEBUG']
            raise e
          rescue RestClient::ExceptionWithResponse => e
            puts e.message if ENG['DEBUG']
            raise e
          end
        end

        private

        def endpoint
          URI("#{host}/rest/#{API_VERSION}/applications")
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
