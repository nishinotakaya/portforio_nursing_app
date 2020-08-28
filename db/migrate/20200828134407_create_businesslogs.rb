class CreateBusinesslogs < ActiveRecord::Migration[5.1]
  def change
    create_table :businesslogs do |t|
      t.datetime :log_year
      t.datetime :log_month
      t.datetime :log_day
      t.datetime :log_week
      t.string :log_farewell
      t.string :log_bath
      t.string :log_food
      t.string :log_good_staple_dosage
      t.string :log_good_side_dosage
      t.string :log_body_temperature
      t.string :log_pressure_up
      t.string :log_pressure_down
      t.string :log_pulse
      t.string :re_log_pressure_up
      t.string :re_log_pressure_down
      t.string :re_log_body_temperature
      t.string :re_log_pulse
      t.string :log_hand_washing
      t.string :log_brush_teeth
      t.string :log_special_mention
      t.string :log_record_stamp
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :check_log
      t.string :log_bath_machine
      t.boolean :log_foods
      t.boolean :log_check_return
      t.boolean :check_log_hand_washing
      t.boolean :check_log_brush_teeth
      t.date :log_worked_on 

      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
