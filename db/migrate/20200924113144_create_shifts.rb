class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.string :day_shift #日勤
      t.string :day_shift_a #日勤（リーダー業務)
      t.string :day_shift #夜勤
      t.date :shift_day #シフトの日付、曜日
      t.string :night_shift #夜勤
      t.string :night_duty #宿直
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
