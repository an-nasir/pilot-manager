# frozen_string_literal: true

# payment request controller
class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[show edit update destroy]

  # GET /payment_requests
  def index
    @payment_requests = PaymentRequest.all
  end

  # GET /payment_requests/1
  def show; end

  # GET /payment_requests/new
  def new
    @payment_request = PaymentRequest.new
  end

  # GET /payment_requests/1/edit
  def edit; end

  # POST /payment_requests
  def create
    @payment_request = PaymentRequest.new(payment_request_params)

    if @payment_request.save
      redirect_to @payment_request, notice: 'Payment request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /payment_requests/1
  def update
    if @payment_request.update(payment_request_params)
      redirect_to @payment_request, notice: 'Payment request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /payment_requests/1
  def destroy
    @payment_request.destroy
    redirect_to payment_requests_url, notice: 'Payment request was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment_request
    @payment_request = PaymentRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :status)
  end
end
