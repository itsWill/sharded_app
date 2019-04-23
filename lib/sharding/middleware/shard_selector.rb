module Sharding
  module Middleware
    class ShardSelector
      SHARD_ID_HEADER = 'X-SHARD-ID'

      def self.call(request)
        new(request.headers)
      end

      def initialize(headers)
        @headers = headers
      end

      attr_reader :headers

      def shard
        headers[SHARD_ID_HEADER] || :master
      end
    end
  end
end