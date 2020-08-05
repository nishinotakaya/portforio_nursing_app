class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name #名前
      t.string :client_email #連絡先
      t.integer :telephone_number #電話番号
      t.string :nursing_number #要介護
      t.string :date_of_day #利用日
      t.string :client_disorder #疾患
      t.integer :temperature #来所時体温
      t.integer :affter_temperature #帰宅前体温
      t.integer :vital #血圧
      t.integer :pulse #脈伯
      t.boolean :bath #入浴
      t.boolean :medicine #薬
      t.integer :food #食事量
      t.datetime :client_birthday #生年月日
      t.string :monitoring_worked_on_year #モニタリング作成年
      t.string :monitoring_worked_on_month #モニタリング作成年
      t.string :monitoring_needs #【居宅介護支援計画書の生活全般の解決すべき課題（ニーズ)】
      t.string :monitoring_short_run_target #【居宅介護支援計画書の短期目標
      t.string :monitoring_service_adl #基本的サービスの状況(ADLを含む
      t.string :monitoring_exchange #他者交流
      t.string :monitoring_go_to_home #送迎
      t.string :monitoring_go_to_home_no_reason #問題あり理由
      t.string :monitoring_walking #歩行
      t.string :monitoring_eating #食事
      t.string :monitoring_situation_of_participation #参加状況
      t.string :monitoring_both #入浴
      t.string :monitoring_both_skin_trouble #皮膚トラブル
      t.string :monitoring_changing_clothes #更衣
      t.string :monitoring_community #社会参加
      t.string :monitoring_community_content #社会参加内容
      t.string :monitoring_situation_dey #利用状況
      t.string :monitoring_attention #日常生活上の留意点 及び 介護の工夫など(総合的評価)
      t.string :monitoring_service_need #サービス変更の必要性
     
    end
  end
end

    
