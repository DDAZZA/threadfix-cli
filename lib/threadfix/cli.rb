require "threadfix/cli/version"
require "threadfix/client"

module Threadfix
  class Cli < Thor
    class Error < StandardError; end
    desc "ipsum", "Lorem Ipsum text generator"
    def ipsum
      puts Lorem.ipsum
    end
  end
end
