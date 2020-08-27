class CreateNurselogs < ActiveRecord::Migration[5.1]
  def change
    create_table :nurselogs do |t|
      t.date :nurse_worked_on #日付
      t.string :nurse_body_temperature #来所時体温
      t.string :nurse_body_temperature_after #帰宅前体温
      t.string :nurse_pressure_up #血圧上
      t.string :nurse_pressure_down #血圧下
      t.string :nurse_pulse #脈
      t.string :nurse_both #入浴
      t.string :nurse_medicine #薬
      t.boolean :nurse_medicine_my #薬自分持ち
      t.boolean :nurse_medicine_yes #食前薬あり
      t.boolean :nurse_medicine_after #食後薬あり
      t.string :nurse_food_main #主食量
      t.string :nurse_food_sub #副食量
      t.boolean :nurse_medicine_check #服薬チェック
      t.string :nurse_note #備考
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
