class AddFoodStaff1ToFoodcooks < ActiveRecord::Migration[5.1]
  def change
    add_column :foodcooks,  :food_staff_1, :boolean
    add_column :foodcooks,  :food_staff_2, :boolean
    add_column :foodcooks,  :food_staff_3, :boolean
    add_column :foodcooks,  :food_staff_4, :boolean
    add_column :foodcooks,  :food_staff_5, :boolean
    add_column :foodcooks,  :food_staff_6, :boolean
    add_column :foodcooks,  :food_staff_7, :boolean
    add_column :foodcooks,  :food_staff_8, :boolean
    add_column :foodcooks,  :food_staff_9, :boolean
  end
end
