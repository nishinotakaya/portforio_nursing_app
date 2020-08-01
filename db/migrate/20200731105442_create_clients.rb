class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name #名前
      t.string :client_email #メール
      t.string :nursing_number #要介護
      t.date :date_of_day #利用日
      t.string :client_disorder #疾患
      t.integer :temperature #来所時体温
      t.integer :affter_temperature #帰宅前体温
      t.integer :vital #血圧
      t.integer :pulse #脈伯
      t.boolean :bath #入浴
      t.boolean :medicine #薬
      t.integer :food #食事量
      

      t.timestamps
    end
  end
end
