# frozen_string_literal: true

# Incoming payments requests from Connector app
#
class PaymentRequest < ApplicationRecord
  enum status: { rejected: 2, accepted: 1, pending: 0 }, _default: :pending

  after_commit :update_status

  private

  def update_status
    ManagerPublisher.publish({ status: :accepted, id: emp_payment_request_id, from: 'MANAGER' })
  end
end
