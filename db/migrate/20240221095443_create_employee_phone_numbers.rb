class CreateEmployeePhoneNumbers < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_phone_numbers do |t|
      t.string :phone_number
      t.references :employee_details, null: false, foreign_key: true

      t.timestamps
    end
  end
end
