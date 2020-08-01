class AddAdminToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :admin, :boolean #カラム追加しますよ 「テーブル名」 「カラム名」 「型」trueかfolse
  end
end

