# frozen_string_literal: true

# Manager
class EmpManagersController < ApplicationController
  before_action :set_emp_manager, only: %i[show edit update destroy]

  # GET /emp_managers
  def index
    @emp_managers = EmpManager.all
  end

  # GET /emp_managers/1
  def show; end

  # GET /emp_managers/new
  def new
    @emp_manager = EmpManager.new
  end

  # GET /emp_managers/1/edit
  def edit; end

  # POST /emp_managers
  def create
    @emp_manager = EmpManager.new(emp_manager_params)

    if @emp_manager.save
      redirect_to @emp_manager, notice: 'Emp manager was successfully created.'
    else
      render :new
    end
  end

  # PUT accepts payment request
  def accept_payment
    ManagerPublisher.publish('payment_requests', { status: :accepted })
    redirect_to root_path, notice: 'Accepted'
  end

  # PUT rejects payment request
  def reject_payment
    ManagerPublisher.publish('payment_requests', { status: :rejected })
  end

  # PATCH/PUT /emp_managers/1
  def update
    if @emp_manager.update(emp_manager_params)
      redirect_to @emp_manager, notice: 'Emp manager was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /emp_managers/1
  def destroy
    @emp_manager.destroy
    redirect_to emp_managers_url, notice: 'Emp manager was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_emp_manager
    @emp_manager = EmpManager.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def emp_manager_params
    params.require(:emp_manager).permit(:first_name, :last_name)
  end
end
