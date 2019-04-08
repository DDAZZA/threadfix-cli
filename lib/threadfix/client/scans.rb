require "threadfix/client/scans/upload"

module Threadfix
  module Client
    module Scans
      class <<self
        # @param file_path
        def upload(options={})
          action = Upload.new(options)
          if action.validate
            action.perform!
          end
        end
      end
    end
  end
end
