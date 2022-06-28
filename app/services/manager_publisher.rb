# frozen_string_literal: true

# /app/services/manager_publisher.rb
#
class ManagerPublisher
  def self.publish(payload = {})
    producer = Producer.new
    queue = producer.declare_queue('payouts')
    producer.publish_message(queue.name, payload.to_json)
    producer.close_connection
  end
end
