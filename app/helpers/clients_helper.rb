module ClientsHelper
  attr_accessor :client_birthday
  def age(client_birthday)
    d1= @clients.client_birthday.strftime("%Y%m%d").to_i
    d2= Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end
end
