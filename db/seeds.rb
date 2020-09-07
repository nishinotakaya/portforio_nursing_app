# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create!(name: "相談員",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
             
Staff.create!(name: "介護職員1",
             email: "sample-1@email.com",
             password: "password",
             password_confirmation: "password",
             nursing_care_staff: true)
             
Staff.create!(name: "介護職員2",
             email: "sample-2@email.com",
             password: "password",
             password_confirmation: "password",
             nursing_care_staff: true)            
             
Staff.create!(name: "看護師",
             email: "sample-3@email.com",
             password: "password",
             password_confirmation: "password",
             nurse: true)
             
Staff.create!(name: "厨房",
             email: "food@email.com",
             password: "password",
             password_confirmation: "password",
             )
               
Client.create!(client_name: "よしこ",
               telephone_number: "0471-33333",
               nursing_number: "要介護2",
               )
               
Client.create!(client_name: "近藤",
               telephone_number: "0471999",
               nursing_number: "要介護1",
               )
               
Client.create!(client_name: "すがはら",
               telephone_number: "0471999",
               nursing_number: "要介護5",
               )                  

Client.create!(client_name: "いし子",
                telephone_number: "0471-33333",
                nursing_number: "要介護2",
                )
                
Client.create!(client_name: "一郎",
							telephone_number: "0471999",
							nursing_number: "要介護1",
							)
                
Client.create!(client_name: "ふく",
							telephone_number: "0471999",
							nursing_number: "要介護5",
							)          

Client.create!(client_name: "白坂",
              telephone_number: "0471999",
              nursing_number: "要介護5",
              )                  
     
Client.create!(client_name: "美紀子",
              telephone_number: "0471-33333",
              nursing_number: "要介護2",
               )
                     
Client.create!(client_name: "昭一郎",
              telephone_number: "0471999",
              nursing_number: "要介護1",
              )
                     
Client.create!(client_name: "りさ子",
              telephone_number: "0471999",
              nursing_number: "要介護5",
              )                        


                         

