class SessionsController < ApplicationController

  def new
  end

 # userの最初のログイン先
 # userをみつけてきて代入
  def create
    staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff && staff.authenticate(params[:session][:password])
      log_in staff
      # [:seession][:remember_me]1入ってたら覚えろ入ってなければ忘れろ
      params[:session][:remember_me] == '1' ? remember(staff) : forget(staff)
      # adminはboolean型なので?の聞き方！
      if staff.admin?
        redirect_to staffs_url
      else
        # 前に戻れ！
        redirect_back_or staff
      end  
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
     # ログイン中の場合のみログアウト処理を実行します。
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end