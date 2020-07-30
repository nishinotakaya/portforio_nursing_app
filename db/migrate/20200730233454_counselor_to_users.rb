class CounselorToUsers < ActiveRecord::Migration[5.1]
  def change
     add_column :users, :counselor, :boolean, default: false
  end
end
