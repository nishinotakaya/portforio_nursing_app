class AddCheckLogToBusinessLog < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :check_log, :boolean
  end
end
