# frozen_string_literal: true

# Incoming payments requests from Connector app
#
class PaymentRequest < ApplicationRecord
  enum status: { rejected: 0, accepted: 1 }, _default: :rejected
end
