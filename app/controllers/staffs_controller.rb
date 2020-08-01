class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info] #before_actionは一番最初に定義される！
  before_action :logged_in_staff, only: [:show, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_staff, only: [:show, :edit, :update]
  before_action :admin_staff, only: [:index, :update, :destroy, :working_employee_list]
  before_action :admin_or_correct_staff, only: :show
  before_action :set_one_month, only: :show
  

  def index
    @staffs = Staff.paginate(page: params[:page])
    if params[:search].present?
      @staffs = @staffs.search(params[:search])
    end
  end
   
 
    
  
  def import
    if params[:file].blank?
      flash[:warning] = "CSVファイルが選択されていません。"
    else  
    # fileはtmpに自動で一時保存される
      Staff.import(params[:file])
      flash[:success] = "ユーザー情報をインポートしました。"  
      redirect_to users_url
    end
  end
  
 
 
  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
    @overwork_count = Attendance.where(overtime_status: "申請中", instructor_confirmation: @staff.name).where.not(id: @staff.id).count #残業申請のお知らせの件数
    @overchange_count = Attendance.where(change_status: "申請中", instructor_confirmation: @staff.name).where.not(id: @staff.id).count #勤怠編集のお知らせ件数
    @user_one_month_attendance_count = Attendance.where(user_one_month_attendance_status: "申請中", instructor_confirmation: @staff.name).where.not(id: @staff.id).count #所属長承認申請のお知らせ件数
    @superior = Staff.where(superior: true).where.not(id: @staff.id)
    @attendance_first_day = @staff.attendances.find_by(worked_on: @first_day) #@staffのattendancesモデルの中から日付の月初日を入れてあげる。
    
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end 
      format.csv do
        send_data render_to_string, filename: "(勤怠情報).csv", type: :csv
      end
    end
  end
  
    
  

  def new
    @staff = Staff.new
  end

  def create
    @staff = User.new(user_params)
    if @staff.save
      log_in @staff
      flash[:success] = '新規作成に成功しました。'
      redirect_to @staff
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @staff.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @staff
    else
      render :index      
    end
  end

  def destroy
   @staff.destroy
    flash[:success] = "#{@staff.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @staff.update_attributes(basic_info_params)
      flash[:success] = "#{@staff.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@staff.name}の更新は失敗しました。<br>" + @staff.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def working_employee_list
    @staffs = Staff.all.includes(:attendances)
  end 
  
  #勤怠ログ
  def attendance_log
    @staff = Staff.find(params[:id])
    #最初に条件を書いて、条件がtrueだったらうえfalseは下
    params["select_year(1i)"].present? ? @year = Date.new(params["select_year(1i)"].to_i, params["select_year(2i)"].to_i, 1)
                                        : @year = Date.today
    params["select_month(2i)"].present? ? @month = Date.new(params["select_month(1i)"].to_i, params["select_month(2i)"].to_i, 1)
                                        : @month = Date.today
    #@staff(自分)のattendance、@year(年）@month(月) @month.to_s[5..6]は6文字目、7文字目抜き取る
    @attendances = @staff.attendances.where(change_status: "承認").where('cast(worked_on as text) LIKE ?', "%#{@year.year}-#{@month.to_s[5..6]}%").order(:worked_on) 
                                 
                                      
  end
  
  
  
  

private

    

    def basic_info_params
      params.require(:staff).permit(:name, :email, :department, :affiliation, :password, :password_confirmation, :employee_number, :uid, :designated_work_start_time, :designated_work_end_time)
    end

    def user_params
      params.require(:staff).permit(:name, :email, :affiliation, :password, :password_confirmation, :employee_number, :uid, :designated_work_start_time, :designated_work_end_time)
    end
    
    def set_user
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
      redirect_to (root_url) unless current_staff.admin?
    end
    
    def admin_or_correct_staff
      @staff = Staff.find(params[:id]) if @staff.blank?
      unless current_staff?(@staff) || current_staff.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
    
    
end