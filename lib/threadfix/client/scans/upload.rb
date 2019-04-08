require 'rest-client'

module Threadfix
  module Client
    module Scans
      class Upload
        attr_accessor :file_path, :app_id

        def initialize(options={})
          @file_path = options[:file_path]
          @app_id = options[:app_id]
        end

        def validate
          puts 'validating'
          true
        end

        def perform!
          puts 'performing'
          begin
            RestClient.post(
              "#{host}/threadfix/rest/v2.4.5/applications/#{app_id}/upload",
              file: File.new(file_path),
              headers: { "Accept"=>"application/json", "Authorization" => "APIKEY #{apiKey}"}
            )
          rescue RestClient::ExceptionWithResponse => e
            require 'pry'; binding.pry
          end
        end

        private

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
