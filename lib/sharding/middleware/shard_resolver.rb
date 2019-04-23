# frozen_string_literal: true
module Sharding
  module Middleware
    class ShardResolver < ActiveRecord::Middleware::DatabaseSelector::Resolver

      def initialize(context, options)
        super
        @shard = context.shard
      end

      attr_reader :shard

      def read(&blk)
        if @shard = :maser
          read_from_master(&blk)
        else
          read_from_shard(&blk)
        end
      end

      def write(&blk)
        if @shard = :master
          write_to_master(&blk)
        else
          write_to_shard(&blk)
        end
      end

      private

      def read_from_master(&blk)
        MasterRecord.connected_to(database: :master) do
          instrumenter.instrument("shard_selector.raead_from_master.#{shard}") do
            yield
          end
        end
      end

      def write_to_master(&blk)
        MasterRecord.connected_to(database: :master) do
          instrumenter.instrument("shard_selector.raead_from_master.#{shard}") do
            yield
          end
        end
      end

      def read_from_shard(&blk)
        ActiveRecord::Base.connected_to(database: "shard_#{shard}".to_sym) do
          instrumenter.instrument("shard_selector.read_from_shard.#{shard}") do
            yield
          end
        end
      end

      def write_to_shard(&blk)
        ActiveRecord::Base.connected_to(database: "shard_#{shard}".to_sym) do
          instrumenter.instrument("shard_selector.write_to_shard.#{shard}") do
            yield
          end
        end
      end
    end
  end
end