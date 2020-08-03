class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name #名前
      t.string :client_email #連絡先
      t.integer :telephone_number #電話番号
      t.string :nursing_number #要介護
      t.string :date_of_day #利用日
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
      t.datetime :client_birthday #生年月日
      t.datetime :monitoring_worked_on_year #モニタリング作成年
      t.datetime :monitoring_worked_on_month #モニタリング作成年
      t.string :monitoring_needs #【居宅介護支援計画書の生活全般の解決すべき課題（ニーズ)】
      t.string :monitoring_short_run_target #【居宅介護支援計画書の短期目標
      t.string :monitoring_service_adl #基本的サービスの状況(ADLを含む
      t.string :monitoring_exchange #他者交流
      t.string :monitoring_exchange_yes #保たれている
      t.string :monitoring_exchange_so_yes #ほぼ保たれている
      t.string :monitoring_exchange_so_no #ほぼ保たれていない
      t.string :monitoring_exchange_no #保たれていない
      t.string :monitoring_go_to_home #送迎
      t.string :monitoring_go_to_home_yes #問題なし 
      t.string :monitoring_go_to_home_no #問題あり
      t.string :monitoring_go_to_home_no_reason #問題あり理由
      t.string :monitoring_walking #歩行
      t.string :monitoring_walking #自立
      t.string :monitoring_walking #見守り
      t.string :monitoring_walking #一部介助
      t.string :monitoring_walking #介助
      t.string :monitoring_walking #車いす
      t.string :monitoring_eating #食事
      t.string :monitoring_eating_yes_self_support #自立
      t.string :monitoring_eating_so_no_self_support #一部介助
      t.string :monitoring_eating_no_self_support #全介助
      t.string :monitoring_situation_of_participation #参加状況
      t.string :monitoring_situation_of_participation_yes #毎回実施
      t.string :monitoring_situation_of_participation_so_yes #ほぼ毎回実施
      t.string :monitoring_situation_of_participation_so_no #時々参加
      t.string :monitoring_situation_of_participation #あまりしない
      t.string :monitoring_both #入浴
      t.string :monitoring_both_yes #自立
      t.string :monitoring_both_so_yes #一部介助
      t.string :monitoring_both_no #全解除
      t.string :monitoring_both_skin_trouble #皮膚トラブル
      t.string :monitoring_changing_clothes #更衣
      t.string :monitoring_changing_clothes_yes #自立
      t.string :monitoring_changing_clothes_so_yes #一部自立
      t.string :monitoring_changing_clothes_no #全介助
      t.string :monitoring_community #社会参加
      t.string :monitoring_community_yes #社会参加している
      t.string :monitoring_community_content #社会参加内容
      t.string :monitoring_community_no #社会参加していない
      t.string :monitoring_community_nothing #実施なし
      t.string :monitoring_situation_dey #利用状況
      t.string :monitoring_situation_dey_yes #休みなく利用
      t.string :monitoring_situation_dey_no #休んだ日がある
      t.string :monitoring_situation_dey_reason #休んだ理由
      t.string :monitoring_attention #日常生活上の留意点 及び 介護の工夫など(総合的評価)
      t.string :monitoring_service_need #サービス変更の必要性
      t.string :monitoring_service_need_no #必要なし
      t.string :monitoring_service_need_yes #必要あり
      t.string :monitoring_service_need_yes_reason #必要ありの理由
    end
  end
end

    
