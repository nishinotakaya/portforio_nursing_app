class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t| #項目の名前もわかりやすいように並べる！わかりやすいように！
      t.date :worked_on # 日付
      t.datetime :started_at #勤務開始時間
      t.datetime :finished_at #勤務終了時間
      t.string :note #備考
      t.datetime :plan_finished_at #終了予定時間 
      t.boolean :tomorrow #翌日 booleanはtrueかfolse
      t.string :business_processing_contents #業務処理内容
      t.string :instructor_confirmation #上長の名前 string 文字型
      t.string :overtime_status #残業申請の状態
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
      
       
      
