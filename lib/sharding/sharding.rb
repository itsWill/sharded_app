module Sharding
  class << self
    SHARD_IDS = [1, 2, 3, 4, 5, 6, 7, 8, 10]

    def shard_ids
      SHARD_IDS
    end

    def test_shard_ids
      [1, 2]
    end
  end
end