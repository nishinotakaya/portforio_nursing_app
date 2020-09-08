module ClientsHelper
	attr_accessor :client_birthday
	def age(client_birthday)
		d1= client_birthday.strftime("%Y%m%d").to_date
    d2= Date.today.strftime("%Y%m%d").to_date
    return (d2 - d1) / 10000
  end
end
