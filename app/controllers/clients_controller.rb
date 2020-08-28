class ClientsController < ApplicationController
before_action :set_one_month, only: :show
 
  
  def index
    @clients = Client.paginate(page: params[:page])

  end
  

  def new
  end
  
  def show
    @client = Client.find(params[:id])
    @monitorings = @client.monitorings.where(check_monitoring: true).order(:monitoring_worked_on_year, :monitoring_worked_on_month).reverse_order.page(params[:page]).per(10)
    @asesments = @client.asesments.where(check_a: true).order(:asesment_create_year, :asesment_create_day).reverse_order.page(params[:page]).per(10)
    @businesslogs = @client.businesslogs.where(check_log: true).order(:log_year,:log_month).reverse_order.page(params[:page]).per(10)
  end
  #def client_show
    #@client = Client.find(params[:id])
     #respond_to do |format|
      #format.html
      #format.pdf do
        #render template: 'clients/clients_show.html.erb'
        #pdf: 'monitoring', #pdfファイルの名前。これがないとエラーが出ます
               #layout: 'monitoring_basic_info.html', #レイアウトファイルの指定。views/layoutsが読まれます。
               #template: 'clients/clients_show.html.erb'#テンプレートファイルの指定。viewsフォルダが読み込まれます。
         
     # end
   # end
  #end  
  
  def edit_basic_info 
    @client = Client.find(params[:id])
  end
  

  def update_basic_info #利用者編集
      @client = Client.find(params[:id])
      if @client.update_attributes(client_params)
        flash[:success] = "#{@client.client_name}の基本情報を更新しました。"
      else
        flash[:danger] = "#{@client.client_name}の更新は失敗しました。<br>" + @client.errors.full_messages.join("<br>")
      end
      redirect_to clients_url and return
  
  end
  
 
  
  def create
    @client = Client.new(client_create_params)
    if @client.save
      log_in @client
      flash[:success] = '利用者を追加しました。'
      redirect_to clients_url  and return
    else
      render 
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:success] = "利用者を削除しました。"
    redirect_to clients_url
  end

  def create_use_check
    if params[:use_check] == "true"
      @client = Client.new(client_check)
      if @client.save
        log_in @client
        flash[:success] = '本日利用に追加しました。'
        redirect_to clients_url and return
      else
        render action: :index 
      end
    else
      flash[:success] = 'チェックしてください。'
      render action: :index 
    end   
  end  
  
  
  
   

  
  
    
  private
  
  
  
  def client_params
    params.require(:client).permit(:client_name_japanese, :client_name, :client_email, :telephone_number, :nursing_number, :client_birthday, :sex,  date_of_day: [] )
  end
  
  def client_create_params
    params.permit(:client_name_japanese, :client_name, :nursing_number, :client_name_japanese, :client_email, :telephone_number, :client_birthday, :sex, date_of_day: [])
  end  
  
  def client_check
    params.permit(:use_check)
  end  
  
  
end
