class SessionsController < ApplicationController

  def new
  end

 # userの最初のログイン先
 # userをみつけてきて代入
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # [:seession][:remember_me]1入ってたら覚えろ入ってなければ忘れろ
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.admin?
        redirect_to users_url
      else
        # 前に戻れ！
        redirect_back_or user
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