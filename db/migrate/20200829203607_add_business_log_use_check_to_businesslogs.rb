class AddBusinessLogUseCheckToBusinesslogs < ActiveRecord::Migration[5.1]
  def change
    add_column :businesslogs, :business_log_use_check, :boolean
  end
end
