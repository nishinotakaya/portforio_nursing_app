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
  
 
 
  def show
  end
  
    
  

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(user_params)
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

  
  
  
  
  

private

    

    def basic_info_params
      params.require(:staff).permit(:name, :email, :affiliation, :password, :password_confirmation, :employee_number, :uid, :designated_work_start_time, :designated_work_end_time)
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