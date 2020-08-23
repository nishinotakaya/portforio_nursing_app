class CreateMonitorings < ActiveRecord::Migration[5.1]
  def change
    add_column :monitorings, :check, :boolean
  end
end
