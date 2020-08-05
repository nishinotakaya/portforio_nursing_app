class ClientsController < ApplicationController
 
 
  
  def index
    @clients = Client.all
  end
  
  def show
   
  end

  def new
  end
  
  def edit_basic_info
    @client = Client.find(params[:id])
  end
  

  def update_basic_info
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
  
  def monitoring_basic_info
    @client = Client.find(params[:id])
  end  
  
  def update_monitoring_basic_info
    @client = Client.find(params[:id])
    if @client.update_attributes(client_monitoring_params)
      flash[:success] = "利用者情報報告書を更新しました！"
      redirect_to clients_url(@client)and return
    else
    render 'monitoring_basic_info'
    end
  end
  
  
    
  private
  
  
  
  def client_params
    params.require(:client).permit(:client_name, :nursing_number, :client_birthday, date_of_day: [] )
  end
  
  def client_create_params
    params.permit(:client_name, :nursing_number, :client_birthday, date_of_day: [])
  end  
  
  def client_monitoring_params
    params.require(:client).permit(:monitoring_worked_on_year, :monitoring_worked_on_month, :monitoring_needs, :monitoring_short_run_target, :monitoring_service_adl, 
                                   :monitoring_situation_dey, :monitoring_attention, :monitoring_exchange, :monitoring_go_to_home, :monitoring_walking, :monitoring_eating , :monitoring_situation_of_participation, 
                                  :monitoring_both, :monitoring_changing_clothes, :monitoring_community, :monitoring_situation_dey, :monitoring_service_need )
  end    
  
  
end
