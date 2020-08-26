class AddLogWorkedOnToBusinessLog < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :log_worked_on, :date #logの日付
  end
end
