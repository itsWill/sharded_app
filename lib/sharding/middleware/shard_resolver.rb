# frozen_string_literal: true
module Sharding
  module Middleware
    class ShardResolver < ActiveRecord::Middleware::DatabaseSelector::Resolver

      def initialize(context, options)
        super
        @shard_id = context.shard_id
      end

      attr_reader :shard_id

      def read(&blk)
        read_from_shard(&blk)
      end

      def write(&blk)
       write_to_shard(&blk)
      end

      private

      def read_from_shard(&blk)
        ActiveRecord::Base.connected_to(database: "shard_#{shard_id}".to_sym) do
          instrumenter.instrument("shard_selector.read_from_shard.#{shard_id}") do
            yield
          end
        end
      end

      def write_to_shard(&blk)
        ActiveRecord::Base.connected_to(database: "shard_#{shard_id}".to_sym) do
          instrumenter.instrument("shard_selector.write_to_shard.#{shard_id}") do
            yield
          end
        end
      end
    end
  end
end