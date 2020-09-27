class ClientsController < ApplicationController
before_action :set_one_month, only: :show
# before_action :set_staff
 
  
  def index
    @clients = Client.all
    @search_params = client_search_params
    @clients = Client.search(@search_params)
  end
  

  def new
  end
  
  def show
    @client = Client.find(params[:id])
    @monitorings = @client.monitorings.where(check_monitoring: true).order(:monitoring_worked_on_year, :monitoring_worked_on_month).reverse_order.page(params[:page]).per(6)
    @asesments = @client.asesments.where(check_a: true).order(:asesment_create_year, :asesment_create_day).reverse_order.page(params[:page]).per(6)
    @businesslogs = @client.businesslogs.where(check_log: true).order(:log_year,:log_month).reverse_order.page(params[:page]).per(6)
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

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:success] = "利用者を削除しました。"
    redirect_to clients_url
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
  

  


  def create_use_check
    if params[:use_check] == "true"
      if @client.update_attributes(client_check)
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
  
  def businesslog_clients #本日の利用者チェック業務日誌一覧
    @clients = Client.all
    @search_params = client_search_params
    @clients = Client.search(@search_params)
  end	
  
  def update_businesslog_client_now #本日の利用者の業務日誌
		ActiveRecord::Base.transaction do
      #@client= Client.find(params[:id])
      n1 = 0
      client_check.each do |id, item|
        if item[:use_check] == "true"
          n1 = n1 + 1
          client = Client.find(id)
          client.update_attributes!(item)
          Businesslog.create!(client_id: id, log_year: Date.today, log_month: Date.today) 
        end
      end
      flash[:success] = "本日の利用人数は#{n1}人です！！今日も一日頑張っていきましょう！！<^0^>"
      redirect_to businesslog_clients_client_url
		end					
	rescue ActiveRecord::RecordInvalid
		flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to  businesslog_clients_client_url	
  end




  private

  def client_params
    params.require(:client).permit(:client_name_japanese, :client_name, :client_email, :telephone_number, :nursing_number, :client_birthday, :sex,  date_of_day: [] )
  end
  
  def client_create_params
    params.permit(:client_name_japanese, :client_name, :nursing_number, :client_name_japanese, :client_email, :telephone_number, :client_birthday, :sex, date_of_day: [])
  end  
  
  def client_check
    params.require(:client).permit(clients: [:use_check])[:clients]
  end  
  
  def client_search_params
    params.fetch(:search, {}).permit(:client_name, :date_of_day, :client_birthday)
  end
  # def set_staff
  #   @staff = Staff.find(params[:staff_id])
  # end
  
end
