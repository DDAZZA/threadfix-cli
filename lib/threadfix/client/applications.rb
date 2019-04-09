require "threadfix/client/applications/lookup"

module Threadfix
  module Client
    module Applications
      class <<self

        # @param file_path
        # @return Hash
        def lookup(options={})
          action = Lookup.new(options)
          action.perform!
        end
      end
    end
  end
end
