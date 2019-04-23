module Sharding
  module Migration
    def mark_as_master_migration!
      @master_migration = true
    end

    def master_migration?
      !!@master_migration
    end
  end

  module MigrationConnection
    def connection                          # def connection
      if self.class.master_migration?       #   if self.class.master_migration?
       MasterRecord.connection              #     Sharding.connections.master
      else                                  #   else
        super                               #     Sharding.connections.shard
      end                                   #   end
    end                                     # end
  end
end

module ActiveRecord
  class Migration
    prepend Sharding::MigrationConnection
    extend Sharding::Migration

    %w(create_table drop_table).each do |name|
      define_method "#{name}_without_sharding" do |*args, &blk|
        method_missing(name, *args, &blk)
      end
    end

    def create_table(table_name, options = {}, &block)
      create_table_without_sharding(table_name, options, &block)
    rescue => e
      # rescue error for duplicate create tabkles for simplicity
      puts "Failed migration: #{e.message}"
    end
  end
end

