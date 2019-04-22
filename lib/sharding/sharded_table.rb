# frozen_string_literal: true
module Sharding
  module ShardedTable
    extend ActiveSupport::Concern

    included do
      before_create do
        if has_attribute?(:shop_id) && shop_id.nil?
          raise "Sharded model #{self.class.name} crated without shop_id"
        end
      end
    end
  end
end