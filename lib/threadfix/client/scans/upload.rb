require 'rest-client'
require 'json'

module Threadfix
  module Client
    module Scans
      class Upload
        API_VERSION='2.5'
        attr_accessor :file_path, :app_id

        def initialize(options={})
          @file_path = options[:file_path]
          @app_id = options[:app_id]
        end

        def perform!
          begin
            r = RestClient.post(
              "#{host}/rest/#{API_VERSION}/applications/#{app_id}/upload",
              { file: file },
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
