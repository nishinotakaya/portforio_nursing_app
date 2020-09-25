# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create!(name: "A",
             email: "sample@email.com",
             attachment: "相談員",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
             
Staff.create!(name: "B",
             email: "sample-1@email.com",
             attachment: "介護職",
             password: "password",
             password_confirmation: "password",
             nursing_care_staff: true)
             
Staff.create!(name: "C",
             email: "sample-2@email.com",
             attachment: "介護職",
             password: "password",
             password_confirmation: "password",
             nursing_care_staff: true)            
             
Staff.create!(name: "D",
             email: "sample-3@email.com",
             attachment: "看護師",
             password: "password",
             password_confirmation: "password",
             nurse: true)
             
Staff.create!(name: "itaya",
             email: "itaya@email.com",
             attachment: "介護職",
             password: "password",
             password_confirmation: "password",
             )


Staff.create!(name: "ITAYA",
            email: "itaya@email.com",
            attachment: "介護職",
            password: "password",
            password_confirmation: "password",
            shift_admin: true)
               
Client.create!(client_name: "K_A",
               telephone_number: "0471-33333",
               date_of_day: "火,木,土",
               nursing_number: "要介護2",
               )
               
Client.create!(client_name: "K_S",
               telephone_number: "0471999",
               date_of_day: "月,水,金",
               nursing_number: "要介護1",
               )
               
Client.create!(client_name: "M_H",
               telephone_number: "0471999",
               date_of_day: "火,土",
               nursing_number: "要介護5",
               )                  

Client.create!(client_name: "A_Y",
                telephone_number: "0471-33333",
                date_of_day: "火",
                nursing_number: "要介護2"
                )
Client.create!(client_name: "S_J",
                telephone_number: "0471-33333",
                date_of_day: "火,土",
                nursing_number: "要介護2"
                 ) 

Client.create!(client_name: "K",
                telephone_number: "0471-33333",
                date_of_day: "木",
                nursing_number: "要介護2"
                     ) 

Client.create!(client_name: "T_T",
                telephone_number: "0471-33333",
                date_of_day: "火,木",
                nursing_number: "要介護2"
                             )
                     
Client.create!(client_name: "S_Y",
                telephone_number: "0471-33333",
                date_of_day: "月,火,水,木,金",
                nursing_number: "要介護1"
             )
             
Client.create!(client_name: "H_T",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金",
                nursing_number: "要介護2"
                             )              

Client.create!(client_name: "K_W",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金",
                nursing_number: "要介護2"
                )
                                     
Client.create!(client_name: "K_S",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金",
                nursing_number: "要介護1"
                )
                             
Client.create!(client_name: "S_?",
                telephone_number: "0471-33333",
                date_of_day: "月,火,水,木,金",
                nursing_number: "要介護2"
                                             )              
            
Client.create!(client_name: "O_I",
                telephone_number: "0471-33333",
                date_of_day: "月,水,金,土",
                nursing_number: "要介護2"
                 )              
                                                                                             

            

