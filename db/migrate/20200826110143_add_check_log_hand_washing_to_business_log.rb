class AddCheckLogHandWashingToBusinessLog < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :check_log_hand_washing, :boolean #うがいチェック
  end
end
