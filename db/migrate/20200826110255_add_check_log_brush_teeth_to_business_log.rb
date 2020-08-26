class AddCheckLogBrushTeethToBusinessLog < ActiveRecord::Migration[5.1]
  def change
    add_column :business_logs, :check_log_brush_teeth, :boolean #歯磨きチェック
  end
end
