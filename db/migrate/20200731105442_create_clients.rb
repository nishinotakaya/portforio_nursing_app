class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name #名前
      t.string :client_email #連絡先
      t.string :nursing_number #要介護
      t.string :date_of_day
      t.string :date_of_day_monday #利用する月曜日
      t.string :date_of_day_tuesday #利用する火曜日
      t.string :date_of_day_wednesday #利用する水曜日
      t.string :date_of_day_thursday #利用する木曜日
      t.string :date_of_day_friday #利用する金曜日
      t.string :date_of_day_saturday #利用する土曜日
      t.string :date_of_day_sunday #利用する日曜日
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
