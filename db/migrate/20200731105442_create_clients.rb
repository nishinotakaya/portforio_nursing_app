class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name_japanese #利用者名ふりがな
      t.string :client_name #名前
      t.string :client_email #住所
      t.string :telephone_number #電話番号
      t.string :nursing_number #要介護(認定情報)
      t.string :date_of_day #利用日
      t.datetime :client_birthday #生年月日
      t.date :worked_on #日付
      t.string :sex #性別
      t.boolean :use_check
    end
  end
end

    
