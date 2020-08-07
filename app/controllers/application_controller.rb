class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  $days_of_the_week = %w{日 月 火 水 木 金 土}

  # beforフィルター

  # paramsハッシュからユーザーを取得します。
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # ログイン済みのユーザーか確認します。
  def logged_in_staff
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to(root_url) unless current_staff?(@staff)
  end

  # システム管理権限所有かどうか判定します。
  def admin_staff
    redirect_to root_url unless current_user.admin?
  end

  # ページ出力前に1ヶ月分のデータの存在を確認・セットします。set_one_month(一ヵ月分の勤怠情報)
  def set_one_month 
    @first_day = params[:date].nil? ? 
    #params[:date]（showの月の隣の矢印が押されたか？)がnilか？
    #月初日が今月か？先月か？先々月か？のもの #当月分のデータを取得してだしてあげてる！
    Date.current.beginning_of_month : params[:date].to_date
    #nilだったら Date.current.beginning_of_month（当月の月初日)を@first_dayに入れる「Date.current=今日」 
    #nilじゃなかったらparams[:date].to_dateにいれる！ @first_day= 1/1や2/1, その日の月の1日
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day] # 対象の月の日数を代入します。
    # ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    @clients = Client.where(worked_on: @first_day..@last_day).order(:worked_on)

    unless one_month.count == @clients.count # それぞれの件数（日数）が一致するか評価します。
      ActiveRecord::Base.transaction do # トランザクションを開始します。
        # 繰り返し処理により、1ヶ月分の勤怠データを生成します。
        one_month.each { |client| Client.create!(worked_on: client) }
      end
    @clients = @client.monitoring.where(worked_on: @first_day..@last_day).order(:worked_on)
    end

  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
    redirect_to root_url
  end
end