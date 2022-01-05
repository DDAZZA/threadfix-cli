require "threadfix/client/applications/lookup"
require "threadfix/client/applications/get_id"

module Threadfix
  module Client
    module Applications
      class <<self

        # @param options[app_name]
        # @param options[team_name]
        # @return Hash
        def lookup(options={})
          action = Lookup.new(options)
          action.perform!
        end

        # @param options[app_name]
        # @return Hash
        def get_id(options={})
          action = GetId.new(options)
          action.perform!
        end
      end
    end
  end
end
