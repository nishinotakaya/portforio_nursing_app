class CreateFoodcooks < ActiveRecord::Migration[5.1]
  def change
    create_table :foodcooks do |t|
      t.date :food_worked_on #日付
      t.boolean :staff_food #スタッフの食事チェック
      t.boolean :client_food #利用者さんの食事チェック
      t.string :food_note #備考
      t.references :client, foreign_key: true
      t.string :food_sience #検食者
      t.string :food_staff #スタッフ
      t.boolean :food_staff_1
      t.boolean :food_staff_2
      t.boolean :food_staff_3 
      t.boolean :food_staff_4 
      t.boolean :food_staff_5 
      t.boolean :food_staff_6
      t.boolean :food_staff_7
      t.boolean :food_staff_8
      t.boolean :food_staff_9
      t.timestamps
    end
  end
end
