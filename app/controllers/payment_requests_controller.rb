# frozen_string_literal: true

# payment request controller
class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[show edit update destroy]

  # GET /payment_requests
  def index
    @payment_requests = PaymentRequest.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment_request
    @payment_request = PaymentRequest.find(params[:id])
  end

end
