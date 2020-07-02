class AttendancesController < ApplicationController
  before_action :set_user, only: [:edit_one_month, :update_one_month, ]
  before_action :logged_in_user, only: [:update, :edit_one_month]
  before_action :admin_or_correct_user, only: [:update, :edit_one_month, :update_one_month]
  before_action :set_one_month, only: :edit_one_month

  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"

  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    # 出勤時間が未登録であることを判定します。
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end

  def edit_one_month
  end

  def update_one_month
    ActiveRecord::Base.transaction do # トランザクションを開始します。
      attendances_params.each do |id, item|
        attendance = Attendance.find(id)
        attendance.attributes = item
        attendance.save!(context: :attendance_update)
      end
   end
    flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
    redirect_to user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to attendances_edit_one_month_user_url(date: params[:date])
  end
  
  def edit_overwork_request
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
  end
  
  def update_overwork_request
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id]) #attendanceを更新！
    params[:attendance][:overtime_status] = "申請中"
    if  @attendance.update_attributes(overwork_params) #←ストロングパラメータの名前
      flash[:success] = "残業申請を更新しました"
      redirect_to user_url(@user) #処理で飛ばす先.com/rails/info/routesとホームページの方に書くとroute見れる　 
    else
      flash[:danger] = "残業申請を更新できませんでした。"
      redirect_to user_url(@user) #←user_urlの中に(@user)を入れることにより@userがuser_urlに飛ばされる！
    end
  end
  
  def edit_superior_announcement
    @user = User.find(params[:user_id])
    @attendances = Attendance.where(overtime_status: "申請中", instructor_confirmation: @user.name) #申請中で勤怠のattendanceのレコード
  end
  
  def update_superior_announcement
  end
  
  def new_show
    @user = User.find(params[:user_id])
    @attendances = Attendance.find(params[:id])
   
  end  
  
  
    
  
   private
   
    def overwork_params #ストロングパラメーター
       params.require(:attendance).permit(:plan_finished_at, :tomorrow, :business_processing_contents, :instructor_confirmation, :overtime_status)#この中のものを更新する！_edit_overwork_request.html.erbから更新」
    end
    # 1ヶ月分の勤怠情報を扱います。
    def attendances_params
      params.require(:user).permit(attendances: [:change, :overtime_status])[:attendances]#この中の物は複数ある時に更新する [:attendance]はviewファイルで指定したところ
    end
    #require(:user)は中の(attendances: [:started_at, :finished_at, :note])[:attendances]のこと
    #require(:user)ない場合はパラメーターの中のものを探すだから第一改装しか見ない！updateできない
    
    
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
end