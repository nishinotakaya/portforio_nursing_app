class AddAsesmentCreateYearToAsesments < ActiveRecord::Migration[5.1]
  def change
    add_column :asesments, :asesment_create_year, :datetime
  end
end
