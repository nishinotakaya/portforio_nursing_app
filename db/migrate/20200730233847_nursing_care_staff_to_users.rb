class NursingCareStaffToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nursing_care_staff, :boolean, default: false
  end
end
