class AddEmployeeNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :employee_number, :string #カラム追加しますよ 「テーブル名」 「カラム名」 「型」
    add_column :users, :uid , :string # 20200622
    add_column :users, :designated_work_start_time,  :datetime, default: Time.current.change(hour: 7, min: 00, sec: 0)#ユーザーの指定勤務開始時間
    add_column :users, :designated_work_end_time, :datetime, default: Time.current.change(hour: 18, min: 00, sec: 0)#ユーザーの指定勤務終了時間
    add_column :users, :user_id, :string#ユーザーID
    add_column :users, :basic_work_time, :datetime, default: Time.current.change(hour: 6, min: 30, sec: 0)
    add_column :users, :affiliation, :string#所属
  end
end
