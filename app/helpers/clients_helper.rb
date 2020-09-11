module ClientsHelper
	attr_accessor :client_birthday
	def age(client_birthday)
		d1= client_birthday.strftime("%F").to_i
    d2= Date.today.strftime("%F").to_i
    return (d2 - d1) 
  end
end
