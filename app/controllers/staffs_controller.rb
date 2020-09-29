class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info] #before_actionは一番最初に定義される！
  before_action :logged_in_staff, only: [:show, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_staff, only: [:show]
 
  before_action :admin_or_correct_staff, only: :show
  before_action :set_one_month, only: :show
  

  def index
    @staffs = Staff.paginate(page: params[:page])
    if params[:search].present?
      @staffs = @staffs.search(params[:search])
    end
  end
  
 
 
  
    
  

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
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
    if @staff.update_attributes(staff_params)
      flash[:success] = "従業員情報を更新しました。"
      redirect_to staffs_url and return
    else
      render :index      
    end
  end

  def destroy
    @staff.destroy
    flash[:success] = "#{@staff.name}のデータを削除しました。"
    redirect_to staffs_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @staff.update_attributes(basic_info_params)
      flash[:success] = "#{@staff.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@staff.name}の更新は失敗しました。<br>" + @staff.errors.full_messages.join("<br>")
    end
    redirect_to staffs_url
  end

  def shifts_edit
    @staffs = Staff.all
  end  

  def check_shifts_update
    ActiveRecord::Base.transaction do
     # m1 = 0
      check_staff_shift.each do |id, item|
        if params[:check_shift] = "true"
          #m1 = m1 + 1
          staff = Staff.find(id)
          staff.update_attributes(item)
          staff.shifts.update(staff_id: id, shift_day: Date.current.beginning_of_month..Date.current.beginning_of_month.end_of_month)
        end
      end    
    end
    flash[:success] = "従業員のシフト業務の準備整いました！" 
    redirect_to shifts_edit_staff_url(current_staff)
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to  shifts_edit_staff_url(current_staff)	
  end

  
  
  

private

    

    def basic_info_params
      params.require(:staff).permit(:name, :email, :cellphone, :password, :password_confirmation, :attachment)
    end

    def staff_params
      params.require(:staff).permit(:name, :email, :cellphone, :password, :password_confirmation, :attachment)
    end
    
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def check_staff_shift
      params.require(:staff).permit(staffs: [:check_shift])[:staffs]
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
    def correct_staff
      redirect_to(root_url) unless current_staff?(@staff)
    end

    
    
    def admin_or_correct_staff
      @staff = Staff.find(params[:id]) if @staff.blank?
      unless current_staff?(@staff) || current_staff.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
    
    
end