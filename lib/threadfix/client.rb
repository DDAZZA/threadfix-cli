require "threadfix/client/scans"

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
        @host = ENV['HOST']
        @key = ENV['THREADFIX_TOKEN']
      end
    end
  end
end
