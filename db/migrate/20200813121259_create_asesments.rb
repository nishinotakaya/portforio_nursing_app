class CreateAsesments < ActiveRecord::Migration[5.1]
  def change
    create_table :asesments do |t|
      t.datetime :asesment_create_day #作成日
      t.string :praxis_place #実行場所
      t.string :filling_up #記入者
      t.string :why_assesment #アセスメント理由
      t.string :client_name_japanese #利用者名ふりがな
      t.string :family_name #家族構成名前
      t.string :family_joining #続柄
      t.string :family_age #年齢
      t.string :family_health #健康状態 
      t.string :crying_email_name #緊急連絡先名前
      t.string :crying_email_joining #緊急続柄
      t.string :crying_email_life #緊急住所
      t.string :crying_call #緊急電話番号
      t.datetime :first_time_reception #初回受付月日
      t.string :reception_method #受付方法
      t.string :reception_requester #依頼者
      t.string :counselling_route #相談経路
      t.string :life_history #生活歴
      t.string :life_now #現在の生活状況
      t.string :trauma_old_people_adl #障害高齢者の日常生活自立度
      t.string :dementia_old_people_adl #認知症高齢者の日常生活自立度
      t.datetime :nursing_number_day #認定年月日
      t.string :nursing_number_duration #認定機関
      t.string :nursing_care_on_sickness_insurance #介護保険
      t.string :health_insurence #医療保険
      t.string :handicapped_notebook #障碍者手帳
      t.string :livelihood_protection #生活保護
      t.string :nursing_care_service #現在利用している介護サービス
      t.string :nursing_care_service_call #事業名、連絡先等
      t.string :nursing_care_service_content #サービス種別
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
