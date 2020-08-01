class NursingCareStaffToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :nursing_care_staff, :boolean, default: false
  end
end
