# manager/app/workers/payment_workers.rb
class PaymentWorker
  include Sneakers::Worker
  from_queue 'manager.payment_requests', env: nil

  def work(payment_request)
    puts '*' * 100
    payment_request_params = JSON.parse payment_request
    p payment_request_params
    puts '*' * 100

    PaymentRequest.create(payment_request_params)
    # request is received in queue
    ack!
  end
end
