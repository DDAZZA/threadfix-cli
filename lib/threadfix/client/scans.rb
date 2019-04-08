require "threadfix/client/scans/upload"

module Threadfix
  module Client
    module Scans
      class <<self

        # @param file_path
        # @return Hash
        def upload(options={})
          action = Upload.new(options)
          action.perform!
        end
      end
    end
  end
end
