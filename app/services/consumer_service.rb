# frozen_string_literal: true

# class ConsumerService
# creates and bind consumer queues
class ConsumerService
  attr_accessor :mq_connection, :channel, :queue

  def initialize(create_channel: false)
    @mq_connection = BaseService.new(auto_recover: true)
    @channel = mq_connection.create_channel if create_channel

    # Tried using it but it was failing, I know it's good to load balance the event fetching
    # @channel.prefetch(2)
  end

  def on_demand_channel
    @channel = mq_connection.create_channel
  end

  def declare_queue(queue_name: 'payout_updates', durable: true)
    Rails.logger.info "queue with name #{queue_name} created"
    @queue = channel.queue(queue_name, durable: durable) unless channel.blank?
  end

  def subscribe_consumer
    queue.subscribe(manual_ack: true) do |delivery_info, _properties, payload|
      payment_request_params = JSON.parse(payload, { symbolize_names: true })
      payment_request_params[:emp_payment_request_id] = payment_request_params.delete :id
      p payment_request_params
      PaymentRequest.create(payment_request_params)
      channel.ack(delivery_info.delivery_tag)
    end
  end

  def close_connection
    mq_connection.close
  end
end
