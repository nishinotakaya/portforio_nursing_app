class CounselorToStaffs < ActiveRecord::Migration[5.1]
  def change
     add_column :staffs, :counselor, :boolean, default: false
  end
end
