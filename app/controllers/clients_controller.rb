class ClientsController < ApplicationController
before_action :set_one_month, only: :show
 
  
  def index
    @clients = Client.paginate(page: params[:page])

  end
  

  def new
  end
  
  def show
    @client = Client.find(params[:id])
   @monitorings = Monitoring.where(check_monitoring: true).order(:monitoring_worked_on_year && :monitoring_worked_on_month)
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
  
   

  
  
    
  private
  
  
  
  def client_params
    params.require(:client).permit(:client_name, :nursing_number, :client_birthday, date_of_day: [] )
  end
  
  def client_create_params
    params.permit(:client_name, :nursing_number, :client_birthday, date_of_day: [])
  end  
  
  
  
end
