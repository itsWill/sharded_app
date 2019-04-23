# README

The sharding is implemented with the existing connection switching API using a custom `Resolver` [here](https://github.com/itsWill/sharded_app/blob/master/lib/sharding/middleware/shard_resolver.rb) with its context class here: [here](https://github.com/itsWill/sharded_app/blob/master/lib/sharding/middleware/shard_selector.rb)


# To Startup the App

`bin/rake db:create  && bin/rake db:migrate && bin/rails server`

# How to connect to different Shards

When making a request we need to send the `X-SHARD-ID` header with the ID corresponding to a database shard, if we omit the `X-SHARD-ID` we default to connecting to the `:master` database. 

To easily change headers in the browser I use this [chrome extension](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj?hl=en)


Note: trying to access a record that lives on the `master` database with something a `X-SHARD-ID` set will result in an error, likewise for using a `master` connection to access a resource outside of `master` database, like hitting the `localhost:3000/shops` route without setting a `X-SHARD-ID` header.
