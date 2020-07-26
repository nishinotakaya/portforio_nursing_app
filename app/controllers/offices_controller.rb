class OfficesController < ApplicationController
  
  before_action :admin_user, only:[:edit, :update, :destroy, :index, :update, :destroy, :create]
  
  def index
    @offices = Office.all
  end
  
  def edit
    @office = Office.find(params[:id])
  end
  
  def show
    
  end
  
  def new
     @office = Office.new
  end  

  def create
    @office = Office.new(office_params)
    if @office.save
      flash[:success] = "拠点を追加しました"
      redirect_to 
    else
      redirect_to  
    end
  end
  
  def update
    @office = Office.find(params[:id])
    if @office.update_attributes(office_params)
      flash[:success] = "拠点情報を更新しました。"
      redirect_to offices_url #処理で飛ばす先.com/rails/info/routesとホームページの方に書くとroute見れる　 
    else
      flash[:danger] = "拠点情報を更新できませんでした"
      render :edit
    end
  end
      
      
  
  def destroy
    @office = Office.find(params[:id])
    @office.destroy
    flash[:success] = "拠点を削除しました。"
    redirect_to offices_url
  end
  
  
  
  private
  
    def set_office
      @office = office.find(params[:id])
    end
    
    def office_params
      params.require(:office).permit(:office_number, :office_name, :office_modality)
    end
    
    def admin_user
      redirect_to (root_url) unless current_user.admin?
    end
    
    
end    
 
  
  

  
    
