class EmployeeDetail < ApplicationRecord
  has_many :employee_phone_numbers

  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :employee_id, :first_name, :last_name, :salary, presence: true
  validates :salary, numericality: true

  accepts_nested_attributes_for :employee_phone_numbers

  def yearly_salary
    salary*12
  end

  def total_salary
    per_day_salary = salary / 30

    financial_year_end = Date.new(2024, 3, 31)
    days_worked = financial_year_end - Date.parse(doj.to_s)

    total_salary = per_day_salary * days_worked.to_i
  end

  def tax_amount
    tax_amount = case total_salary
                 when 0..250000
                   0
                 when 250001..500000
                   (total_salary - 250000) * 0.05
                 when 500001..1000000
                   12500 + (total_salary - 500000) * 0.1
                 else
                   62500 + (total_salary - 1000000) * 0.2
                 end

  end

  def cess_amount
    cess_amount = total_salary > 2500000 ? (total_salary - 2500000) * 0.02 : 0
  end
end
