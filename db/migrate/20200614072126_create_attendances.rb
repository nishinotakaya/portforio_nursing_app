class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t| #項目の名前もわかりやすいように並べる！わかりやすいように！
      t.date :worked_on # 日付
      t.datetime :started_at #勤務開始時間
      t.datetime :finished_at #勤務終了時間
      t.datetime :before_started_at #変更前の開始時間(edit_one_month用)
      t.datetime :before_finished_at #変更前の終了時間(edit_one_month用)
      t.datetime :edit_started_at #編集用の開始時間(edit_one_month用)
      t.datetime :edit_finished_at #編集用の終了時間(edit_one_month用)
      t.date :good_day #承認日
      t.datetime :attended_time #在社時間
      t.string :note #備考
      t.datetime :plan_finished_at #終了予定時間
      t.datetime :over_time #時間外時間
      t.boolean :tomorrow #翌日 booleanはtrueかfolse
      t.string :business_processing_contents #業務処理内容
      t.boolean :change #変更
      t.string :instructor_confirmation #上長の名前 string 文字型
      t.string :overtime_status #残業申請の状態
      t.string :change_status #変更申請の状態
      t.string :user_one_month_attendance_status #一ヵ月の勤怠申請の状態
      
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
      
       
      
