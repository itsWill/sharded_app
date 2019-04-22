class Shop < ApplicationRecord
  include Sharding::ShardedTable
end
