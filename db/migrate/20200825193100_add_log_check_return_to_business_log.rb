class AddLogCheckReturnToBusinessLog < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :log_check_return, :boolean
  end
end
