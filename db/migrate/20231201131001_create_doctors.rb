class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialization
      t.string :office_hours
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
