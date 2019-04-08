require 'thor'
require "threadfix/cli/version"
require "threadfix/cli/scan"
require "threadfix/client"

module Threadfix
  class CLI < Thor

    class Error < StandardError; end

    desc "scan <command>", "manage scans"
    subcommand "scan", Cli::Scan
  end
end
