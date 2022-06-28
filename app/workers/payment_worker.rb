# manager/app/workers/payment_workers.rb
class PaymentWorker
  include Sneakers::Worker
  from_queue('producer_queue')

  def work(payment_request)
    payment_request_params = JSON.parse(payment_request, {symbolize_names: true})
    payment_request_params[:emp_payment_request_id] = payment_request_params.delete :id
    PaymentRequest.create(payment_request_params)
    # request is received in queue
    ack!
  end
end


