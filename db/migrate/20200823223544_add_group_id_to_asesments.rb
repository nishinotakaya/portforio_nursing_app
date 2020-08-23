class AddGroupIdToAsesments < ActiveRecord::Migration[5.1]
  def change
    add_column :asesments, :whrite_year, :datetime #作成年
  end
end
