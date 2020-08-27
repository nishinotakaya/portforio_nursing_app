class AddNursePressureDownToNurselogs < ActiveRecord::Migration[5.1]
  def change
    add_column :nurselogs,:nurse_pressure_down, :string
  end
end
