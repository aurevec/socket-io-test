#$redis =  Redis::Namespace.new("aveapp", redis: Redis.new(host: 'localhost', port: 6379))
$redis =  Redis.new(host: 'localhost', port: 6379)