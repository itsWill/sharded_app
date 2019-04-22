Dir["#{Rails.root}/lib/sharding/*.rb"].each { |file| require file }


# start a thread that replicates the databases every 5 seconds to mock replication.
db_paths = Sharding.shard_ids.map do |shard_id|
  [ "db/#{Rails.env}_#{shard_id}.sqlite3", "db/#{Rails.env}_replica_#{shard_id}.sqlite3" ]
end

Thread.abort_on_exception = true
Thread.new do
  loop do
    puts "[Replication Thread] Starting Replication proccess"
    db_paths.each do |primary, replica|
      `cp #{primary} #{replica}`
    end
    puts "[Replication Thread] Finished Replication proccess"
    sleep(5)
  end
end
