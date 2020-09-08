class AddCellphoneToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :cellphone, :string
  end
end
