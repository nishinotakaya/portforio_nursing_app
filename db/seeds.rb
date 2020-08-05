# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create!(name: "施設長",
             email: "sample@email.com",
             employee_number: 1,
             password: "password",
             password_confirmation: "password",
             admin: true)
             
Staff.create!(name: "看護師",
             email: "superior-1@email.com",
             employee_number: 2,
             password: "password",
             password_confirmation: "password",
             nurse: true)

Staff.create!(name: "相談員",
             email: "superior-2@email.com",
             employee_number: 3,
             password: "password",
             password_confirmation: "password",
             counselor: true)
             
Staff.create!(name: "介護職員1",
             email: "employee-1@email.com",
             employee_number: 4,
             password: "password",
             password_confirmation: "password",
             nursing_care_staff: true)
             
Staff.create!(name: "介護職員2",
             email: "employee-2@email.com",
             employee_number: 4,
             password: "password",
             password_confirmation: "password",
             nursing_care_staff: true)            
             
               
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


                         

