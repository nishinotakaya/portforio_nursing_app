class NurseToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :nurse, :boolean, default: false
  end
end
