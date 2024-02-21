class EmployeeDetailsController < ApplicationController
  def create
    employee_details = EmployeeDetail.new(employee_params)
    if employee_details.save
      render status: :ok, json: {"employee_details": employee_details,"meta": { message: "Employee details successfully posted" }}
    else
      render json: employee_details.errors, status: :unprocessable_entity
    end
  end

  def fetch_details
    employee = EmployeeDetail.find(params[:id])
    details = {
        employee_code: employee.employee_id,
        first_name: employee.first_name,
        last_name: employee.last_name,
        yearly_salary: employee.yearly_salary,
        tax_amount: employee.tax_amount,
        cess_amount: employee.cess_amount,
      }
    render json: details
  end


  private

  def employee_params
    params.require(:employee_details).permit(:employee_id, :first_name, :last_name, :phone_number, :doj, :email, :salary, user_account_attributes: [:phone_number])
  end
end
