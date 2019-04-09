require "threadfix/client"
module Threadfix
  module Cli
    class Scan < Thor
      desc "upload", "Uploads a scan to ThreadFix"
      option :host
      option :app_id, required: true, type: :numeric
      option :file, required: true, aliases: '-f', desc: "Report to upload"
      option :key, desc: "Authorisation key"
      def upload
        Client.configure do |config|
          config.host = options[:host] if options[:host]
          config.key = options[:key] if options[:key]
        end

        begin
          response =  Client::Scans.upload(file_path: options[:file], app_id: options[:app_id] )
          message = response['message']
          message = message + " (ID: #{response['object']['id']})" if response['object'] && response['object']['id']

          puts message
        rescue Errno::ENOENT => e
          puts "Error: File or directory '#{options[:file]}' doesn't exist."
          exit 1
        rescue SocketError => e
          puts "Error: Unable open connection to '#{Client.config.host}'"
          exit 1
        end
      end
    end
  end
end
