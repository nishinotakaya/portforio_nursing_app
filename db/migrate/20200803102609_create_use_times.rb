class CreateUseTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :use_times do |t|
      t.date :use_worked_on #利用日（日にち）
      t.date :use_worked_on_month #利用月（モニタリング用)
      t.timestamps
    end
  end
end
