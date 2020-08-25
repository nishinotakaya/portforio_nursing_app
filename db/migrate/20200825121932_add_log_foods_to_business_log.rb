class AddLogFoodsToBusinessLog < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :log_foods, :boolean
  end
end
