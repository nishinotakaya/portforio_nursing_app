class MonitoringsController < ApplicationController
   before_action :set_client
  
  

  
  def monitoring_basic_info
    @monitoring = @client.monitorings.new
  end  
  
  def monitoring_basic_info_affter
    @monitoring = Monitoring.find(params[:id])
    @monitorings = Monitoring.where(check_monitoring: true).order(:monitoring_worked_on_year && :monitoring_worked_on_month)
  end
  
  def create_monitoring_basic_info
      @monitoring = @client.monitorings.new(client_monitoring_params)
    if @monitoring.save
      flash[:success] = "利用者情報報告書（モニタリング)を追加しました！"
      redirect_to monitoring_basic_info_affter_client_monitoring_url(@client, @monitoring)
    else
      render monitoring_basic_info @client
    end
    
     
  end
  
  
private


  def set_client
    @client = Client.find(params[:client_id])
  end  

  def client_monitoring_params
    params.require(:monitoring).permit(:monitoring_worked_on_year, :monitoring_worked_on_month, :monitoring_needs, :monitoring_short_run_target, :monitoring_service_adl, 
                              :monitoring_situation_dey, :monitoring_attention, :monitoring_exchange, :monitoring_go_to_home, :monitoring_walking, :monitoring_eating , :monitoring_situation_of_participation, 
                                :monitoring_both, :monitoring_changing_clothes, :monitoring_community, :monitoring_situation_dey, :monitoring_service_need, :check_monitoring) #(:monitoring)はform_withと一緒
  end
  
    
  
end
