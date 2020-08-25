class AddLogBathMachineToBusinessLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :log_bath_machine, :string
  end
end
