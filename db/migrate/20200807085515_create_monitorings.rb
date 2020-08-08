class CreateMonitorings < ActiveRecord::Migration[5.1]
  def change
    create_table :monitorings do |t|
      t.datetime :monitoring_worked_on_year #モニタリング作成年
      t.datetime :monitoring_worked_on_month #モニタリング作成月
      t.string :monitoring_needs #【居宅介護支援計画書の生活全般の解決すべき課題（ニーズ)】
      t.string :monitoring_short_run_target #【居宅介護支援計画書の短期目標
      t.string :monitoring_service_adl #基本的サービスの状況(ADLを含む
      t.string :monitoring_exchange #他者交流
      t.string :monitoring_go_to_home #送迎
      t.string :monitoring_walking #歩行
      t.string :monitoring_eating #食事
      t.string :monitoring_situation_of_participation #参加状況
      t.string :monitoring_both #入浴
      t.string :monitoring_changing_clothes #更衣
      t.string :monitoring_community #社会参加
      t.string :monitoring_situation_dey #利用状況
      t.string :monitoring_attention #日常生活上の留意点 及び 介護の工夫など(総合的評価)
      t.string :monitoring_service_need #サービス変更の必要性
      t.boolean :check_monitoring #モニタリング間違いなしチェック
      t.references :client, foreign_key: true
      
      t.timestamps
    end
  end
end
