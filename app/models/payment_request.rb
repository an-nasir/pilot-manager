# frozen_string_literal: true

# Incoming payments requests from Connector app
#
class PaymentRequest < ApplicationRecord
  enum status: { rejected: 2, accepted: 1, pending: 0 }, _default: :pending
end
