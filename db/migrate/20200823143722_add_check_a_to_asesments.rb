class AddCheckAToAsesments < ActiveRecord::Migration[5.1]
  def change
    add_column :asesments, :check_a, :boolean, default: false, null: false #確認ボタン
  end
end
