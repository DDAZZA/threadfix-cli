require 'thor'
require "threadfix/cli/version"
require "threadfix/cli/scan"
require "threadfix/cli/applications"
require "threadfix/client"

module Threadfix
  class CLI < Thor

    class Error < StandardError; end

    desc "version", "print version"
    def version
      puts Cli::VERSION
    end

    desc "scan <command>", "manage scans"
    subcommand "scan", Cli::Scan

    desc "applications <command>", "manage applications"
    subcommand "applications", Cli::Applications
  end
end
