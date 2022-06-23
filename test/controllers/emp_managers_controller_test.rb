# frozen_string_literal: true

require 'test_helper'

class EmpManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emp_manager = emp_managers(:one)
  end

  test 'should get index' do
    get emp_managers_url
    assert_response :success
  end

  test 'should get new' do
    get new_emp_manager_url
    assert_response :success
  end

  test 'should create emp_manager' do
    assert_difference('EmpManager.count') do
      post emp_managers_url,
           params: { emp_manager: { first_name: @emp_manager.first_name, last_name: @emp_manager.last_name } }
    end

    assert_redirected_to emp_manager_url(EmpManager.last)
  end

  test 'should show emp_manager' do
    get emp_manager_url(@emp_manager)
    assert_response :success
  end

  test 'should get edit' do
    get edit_emp_manager_url(@emp_manager)
    assert_response :success
  end

  test 'should update emp_manager' do
    patch emp_manager_url(@emp_manager),
          params: { emp_manager: { first_name: @emp_manager.first_name, last_name: @emp_manager.last_name } }
    assert_redirected_to emp_manager_url(@emp_manager)
  end

  test 'should destroy emp_manager' do
    assert_difference('EmpManager.count', -1) do
      delete emp_manager_url(@emp_manager)
    end

    assert_redirected_to emp_managers_url
  end
end
