# frozen_string_literal: true

require 'bunny'

conn = BaseService.new
conn.start
ch   = conn.create_channel
# ch.prefetch(2)

q1 = ch.queue('payouts', durable: true)
q1.subscribe do |delivery_info, _properties, payload|
  payment_request_params = JSON.parse(payload, { symbolize_names: true })
  payment_request_params[:emp_payment_request_id] = payment_request_params.delete :id
  PaymentRequest.find_or_create_by(payment_request_params)
  ch.ack(delivery_info.delivery_tag)
end
