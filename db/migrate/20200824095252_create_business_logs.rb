class CreateBusinessLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :business_logs do |t|
        t.datetime :log_year #記入年
        t.datetime :log_month #記入月
        t.datetime :log_day #記入日
        t.datetime :log_week #記入週
        t.string :log_farewell #送迎
        t.string :log_bath #入浴
        t.string :log_bath_machine #機械入浴
        t.string :log_food #食事
        t.string :log_good_staple_dosage #食事量(主食)
        t.string :log_good_side_dosage #食事量(副食)
        t.string :log_body_temperature #体温
        t.string :log_pressure_up #血圧上
        t.string :log_pressure_down #血圧下
        t.string :log_pulse #脈
        t.string :re_log_pressure_up #再検 血圧上
        t.string :re_log_pressure_down #再検 血圧下
        t.string :re_log_body_temperature #再検査 体温
        t.string :re_log_pulse #再検 脈
        t.string :log_hand_washing #手洗い
        t.string :log_brush_teeth #歯磨き
        t.string :log_special_mention #特記事項
        t.string :log_record_stamp #支持者印
      t.timestamps
    end
  end
end
