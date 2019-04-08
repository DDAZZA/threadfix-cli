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
          require 'pry'; binding.pry
          RestClient.post("#{host}/rest/applications/#{app_id}/upload", file: File.new(file_path), headers: { "Accept"=>"application/json", "Authorization" => key })
        end

        private

        def host
          # Client.config.host
          'example.com'
        end

        def key
          # Client.config.key
          'asdfadfad'
        end
      end
    end
  end
end
