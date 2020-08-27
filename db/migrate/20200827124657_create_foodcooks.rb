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
      add_column :foodcooks,  :food_staff_1, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_2, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_3, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_4, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_5, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_6, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_7, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_8, :boolean #スタッフチェック
      add_column :foodcooks,  :food_staff_9, :boolean #スタッフチェック
      t.timestamps
    end
  end
end
