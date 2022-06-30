# frozen_string_literal: true

# Manager
class EmpManagersController < ApplicationController
  before_action :set_emp_manager, only: %i[show edit update destroy]
  before_action :set_payment_request, only: %i[accept_payment reject_payment]


  # PUT accepts payment request
  def accept_payment
    ManagerPublisher.publish({ status: :accepted, id: @payment_request.emp_payment_request_id })
    redirect_to root_path, notice: 'Accepted'
  end

  # PUT rejects payment request
  def reject_payment
    ManagerPublisher.publish({ status: :rejected, id: @payment_request.emp_payment_request_id })
    redirect_to root_path, notice: 'Rejected'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_emp_manager
    @emp_manager = EmpManager.find(params[:id])
  end

  def set_payment_request
    @payment_request = PaymentRequest.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def emp_manager_params
    params.require(:emp_manager).permit(:first_name, :last_name)
  end
end
