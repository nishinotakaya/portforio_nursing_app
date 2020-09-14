class HogePersonController < ApplicationController

	before_action :set_hoge_person, only: [:profile]

  # ライセンスホルダの情報を返す。
  def profile
    # TODO: バリデーション
    # TODO: @hoge_personとステータス（成功/失敗）等を含むオブジェクトをjsonで返す。
    render json: @hoge_person
  end

  private
  def set_hoge_person
    # TODO: 返す情報を絞る
    # TODO: enum等、返す情報をフォーマットする。(document必要)
    # TODO: パラメータ名とモデルのカラム名は分けたい。
    @hoge_person = HogePerson.find_by(hoge_number: params[:hoge_number])
  end
end
