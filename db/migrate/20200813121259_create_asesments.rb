class CreateAsesments < ActiveRecord::Migration[5.1]
  def change
    create_table :asesments do |t|
      t.datetime :asesment_create_day #作成日
      t.string :praxis_place #実行場所
      t.string :filling_up #記入者
      t.string :new_or_continuation #新規か継続
      t.string :insurance_number #保険番号
      t.string :client_name_japanese #利用者名ふりがな
      t.string :crying_email #世帯携帯
      t.string :relation_name #上記以外の連絡先の方の名前
      t.string :relation_email #上記以外の住所
      t.string :relation_joining #本人との続柄続柄
      t.string :relation_cellphone #上記以外の電話番号
      t.string :family_health_disease #健康状態現在の疾患
      t.string :family_health_disease_past#健康状態過去の疾患
      t.string :eyesight #視力
      t.string :audition #聴力
      t.string :prosthesis #義歯
      t.string :nomal_vital_body_temperature #平常時バイタル 体温
      t.string :nomal_vital_blood_pressure #平常時血圧
      t.string :nomal_vital_pulse #脈
      t.string :medicina #配薬名
      t.string :information_medicina #配薬情報源
      t.string :hospital_name #かかりつけ医
      t.string :hospital_doctor #医者
      t.string :hospital_doctor_nymber #病院電話番号
      t.string :doctor_bath #医者の指示（入浴)
      t.string :doctor_skin #医者の指示(皮膚疾患)
      t.string :doctor_transfer #移送時留意点
      t.string :doctor_etcetera #その他制限
      t.string :specialized_equipment #特機事項
      t.timestamps
    end
  end
end
