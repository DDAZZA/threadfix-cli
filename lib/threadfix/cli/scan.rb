require "threadfix/client"
module Threadfix
  module Cli
    class Scan < Thor
      desc "upload", "Uploads a scan to ThreadFix"
      option :host
      option 'app-id', required: true, type: :numeric
      option :file, required: true, aliases: '-f', desc: "Report to upload"
      option :key, desc: "Authorisation key"
      def upload
        # Client.configure do |config|
        #   config.host = options[:host] if options[:host]
        #   config.key = options[:key] if options[:key]
        # end
        puts 'Starting'
        # TODO move

        puts Client::Scans.upload(file_path: options[:file], app_id: options['app-id'] )
      end
    end
  end
end
