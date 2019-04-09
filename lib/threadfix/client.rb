require "threadfix/client/scans"
require "threadfix/client/applications"

module Threadfix
  module Client
    class << self
      attr_accessor :config
    end

    def self.configure
      self.config ||= Configuration.new
      yield(config)
    end

    class Configuration
      attr_accessor :host, :key

      def initialize
        @host = ENV['THREADFIX_HOST']
        @key = ENV['THREADFIX_TOKEN']
      end
    end
  end
end
