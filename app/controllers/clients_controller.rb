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
  
  def monitoring_basic_info
    @client = Client.find(params[:id])
  end  
  
  def update_monitoring_basic_info
  end  
  
  private
  
  def client_params
    params.require(:client).permit(:client_name, :nursing_number, :date_of_day_monday, :date_of_day_tuesday, :date_of_day_wednesday,
                                    :date_of_day_thursday, :date_of_day_friday, :date_of_day_saturday, :date_of_day_sunday, :client_birthday)
  end
  
  def client_create_params
    params.permit(:client_name, :nursing_number, :date_of_day_monday, :date_of_day_tuesday, :date_of_day_wednesday,
                                    :date_of_day_thursday, :date_of_day_friday, :date_of_day_saturday, :date_of_day_sunday, :client_birthday)
  end
  
  
  
end
