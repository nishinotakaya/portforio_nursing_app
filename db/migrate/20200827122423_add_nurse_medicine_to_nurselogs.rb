class AddNurseMedicineToNurselogs < ActiveRecord::Migration[5.1]
  def change
    add_column :nurselogs, :nurse_medicine, :string
  end
end
