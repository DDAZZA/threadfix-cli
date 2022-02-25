require 'rest-client'
require 'json'
require 'uri'

module Threadfix
  module Client
    module Scans
      class Upload
        API_VERSION='v2.5'
        attr_reader :file_path, :app_id

        def initialize(options={})
          @file_path = options[:file_path]
          @app_id = options[:app_id]
        end

        def perform!
          begin
            puts "POST #{endpoint.to_s}" if ENV['DEBUG']
            r = RestClient.post(
              endpoint.to_s,
              { file: file },
              { :accept => "application/json", :Authorization => "APIKEY #{apiKey}" }
            )
            JSON.parse(r.body)
          rescue RestClient::NotFound => e
            puts "Endpoint not found (using API version: #{API_VERSION})"
            raise e
          rescue RestClient::ExceptionWithResponse => e
            puts e.message
            raise e
          end
        end

        private

        def endpoint
          URI("#{host}/rest/#{API_VERSION}/applications/#{app_id}/upload")
        end

        def file
          File.new(file_path, 'rb')
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
