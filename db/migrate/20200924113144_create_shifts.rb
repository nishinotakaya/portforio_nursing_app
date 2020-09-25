class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.string :day_shift
      t.date :shift_day
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
