require "threadfix/client"
module Threadfix
  module Cli
    class Applications < Thor
      desc "lookup", "lookup an application ID"
      option :host
      option :key, desc: "Authorisation key"
      option :app_name, required: true
      option :team_name, required: true
      def lookup
        Client.configure do |config|
          config.host = options[:host] if options[:host]
          config.key = options[:key] if options[:key]
        end

        begin
          response =  Client::Applications.lookup(team_name: options[:team_name], app_name: options[:app_name] )
          if response['message'] == ''
            puts "ID: #{response['object']['id']}"
          else
            puts response['message']
          end
        rescue SocketError => e
          puts "Error: Unable open connection to '#{Client.config.host}'"
          exit 1
        end
      end
    end
  end
end
