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
               
Client.create!(client_name: "近藤 A",
               telephone_number: "0471-33333",
               date_of_day: "火,木,土",
               nursing_number: "要介護2",
               )
               
Client.create!(client_name: "近藤 S",
               telephone_number: "0471999",
               date_of_day: "月,水,金",
               nursing_number: "要介護1",
               )
               
Client.create!(client_name: "三00000",
               telephone_number: "0471999",
               date_of_day: "火,土",
               nursing_number: "要介護5",
               )                  

Client.create!(client_name: "有0",
                telephone_number: "0471-33333",
                date_of_day: "火",
                nursing_number: "要介護2"
                )
Client.create!(client_name: "須0 0子",
                telephone_number: "0471-33333",
                date_of_day: "火,土",
                nursing_number: "要介護2"
                 ) 

Client.create!(client_name: "小mat",
                telephone_number: "0471-33333",
                date_of_day: "木",
                nursing_number: "要介護2"
                     ) 

Client.create!(client_name: "田00",
                telephone_number: "0471-33333",
                date_of_day: "火,木",
                nursing_number: "要介護2"
                             )
                     
Client.create!(client_name: "染０",
                telephone_number: "0471-33333",
                date_of_day: "月,火,水,木,金",
                nursing_number: "要介護1"
             )
             
Client.create!(client_name: "本０",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金",
                nursing_number: "要介護2"
                             )              

Client.create!(client_name: "ふく",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金",
                nursing_number: "要介護2"
                )
                                     
Client.create!(client_name: "しょう0000",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金",
                nursing_number: "要介護1"
                )
                             
Client.create!(client_name: "sugahara",
                telephone_number: "0471-33333",
                date_of_day: "月,火,水,木,金",
                nursing_number: "要介護2"
                                             )              
            
Client.create!(client_name: "一郎",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金,土",
                nursing_number: "要介護2"
                 )              
                                                                                             

            

