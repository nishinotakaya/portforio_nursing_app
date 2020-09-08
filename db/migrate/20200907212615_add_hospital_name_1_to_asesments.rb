class AddHospitalName1ToAsesments < ActiveRecord::Migration[5.1]
  def change
    add_column :asesments, :hospital_name_1, :string #かかりつけ医
    add_column :asesments, :hospital_doctor_1, :string #かかりつけ医者
    add_column :asesments, :hospital_doctor_nymber_1, :string #かかりつけ病院番号
  end
end
