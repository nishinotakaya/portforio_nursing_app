class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :age #年齢
      t.string :place #出身地
      t.timestamps
    end
  end
end
