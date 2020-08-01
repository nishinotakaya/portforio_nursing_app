module SessionsHelper

  # 引数に渡されたユーザーオブジェクトでログインします。
  def log_in(staff)
    session[:staff_id] = staff.id
  end

   # 永続的セッションを記憶します（Userモデルを参照）
  def remember(staff)
    staff.remember
    cookies.permanent.signed[:staff_id] = staff.id
    cookies.permanent[:remember_token] = staff.remember_token
  end

  # 永続的セッションを破棄します
  def forget(staff)
    staff.forget # Userモデル参照
    cookies.delete(:staff_id)
    cookies.delete(:remember_token)
  end

  # セッションと@current_userを破棄します
  def log_out
    forget(current_staff)
    session.delete(:staff_id)
    @current_staff = nil
  end

  # 一時的セッションにいるユーザーを返します。
  # それ以外の場合はcookiesに対応するユーザーを返します。
  def current_staff
    if (staff_id = session[:staff_id])
      @current_staff ||= Staff.find_by(id: staff_id)
    elsif (staff_id = cookies.signed[:staff_id])
      staff = Staff.find_by(id: staff_id)
      if staff && staff.authenticated?(cookies[:remember_token])
        log_in staff
        @current_staff = staff
      end
    end
  end

  # 渡されたユーザーがログイン済みのユーザーであればtrueを返します。
  def current_staff?(staff)
    staff == current_staff
  end

  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返します。
  def logged_in?
    !current_staff.nil?
  end

  # 記憶しているURL(またはデフォルトURL)にリダイレクトします。
  def redirect_back_or(default_url)
    redirect_to(session[:forwarding_url] || default_url)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを記憶します。
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end