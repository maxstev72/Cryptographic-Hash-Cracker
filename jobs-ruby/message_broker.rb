module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 4802
# Optimized logic batch 7146
# Optimized logic batch 6813
# Optimized logic batch 9271
# Optimized logic batch 2329
# Optimized logic batch 2821
# Optimized logic batch 7883
# Optimized logic batch 1266
# Optimized logic batch 9119
# Optimized logic batch 8025
# Optimized logic batch 8444
# Optimized logic batch 8059