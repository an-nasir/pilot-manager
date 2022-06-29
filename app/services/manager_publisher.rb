# frozen_string_literal: true

# /app/services/manager_publisher.rb
#
class ManagerPublisher
  def self.publish(payload = {})
    producer = Producer.new
    queue = producer.declare_queue('payout_updates')
    producer.publish_message(queue.name, payload.to_json)
    PaymentRequest.find_by(emp_payment_request_id: payload[:id])&.send("#{payload[:status]}!")
    producer.close_connection
  end
end
