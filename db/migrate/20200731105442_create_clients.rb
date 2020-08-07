class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name #名前
      t.string :client_email #連絡先
      t.integer :telephone_number #電話番号
      t.string :nursing_number #要介護
      t.string :date_of_day #利用日
      t.datetime :client_birthday #生年月日
      
    end
  end
end

    
