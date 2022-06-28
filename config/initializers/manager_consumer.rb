require 'bunny'

conn = BaseService.new
conn.start

ch   = conn.create_channel

q1 = ch.queue("payouts", durable: true)
q1.subscribe do |delivery_info, properties, payload|
  payment_request_params = JSON.parse(payload, {symbolize_names: true})
  payment_request_params[:emp_payment_request_id] = payment_request_params.delete :id
  p payment_request_params
  PaymentRequest.create(payment_request_params)
end
