# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200813121259) do

  create_table "asesments", force: :cascade do |t|
    t.datetime "asesment_create_day"
    t.string "praxis_place"
    t.string "filling_up"
    t.string "new_or_continuation"
    t.string "insurance_number"
    t.string "crying_email"
    t.string "relation_name"
    t.string "relation_email"
    t.string "relation_joining"
    t.string "relation_cellphone"
    t.string "relation_name_2"
    t.string "relation_email_2"
    t.string "relation_joining_2"
    t.string "relation_cellphone_2"
    t.string "relation_name_3"
    t.string "relation_email_3"
    t.string "relation_joining_3"
    t.string "relation_cellphone_3"
    t.string "family_health_disease"
    t.string "family_health_disease_past"
    t.string "eyesight"
    t.string "audition"
    t.string "prosthesis"
    t.string "nomal_vital_body_temperature"
    t.string "nomal_vital_blood_pressure_up"
    t.string "nomal_vital_blood_pressure_down"
    t.string "nomal_vital_pulse"
    t.string "medicina"
    t.string "information_medicina"
    t.string "information_medicina_family"
    t.string "information_medicina_another"
    t.string "hedge_medicine_food"
    t.string "hedge_medicine_food_information"
    t.string "hospital_name"
    t.string "hospital_doctor"
    t.string "hospital_doctor_nymber"
    t.string "doctor_bath"
    t.string "doctor_bath_another"
    t.string "doctor_skin"
    t.string "doctor_skin_another"
    t.string "doctor_transfer"
    t.string "doctor_transfer_another"
    t.string "doctor_etcetera"
    t.string "doctor_etcetera_another"
    t.string "specialized_equipment"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_asesments_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "client_name_japanese"
    t.string "client_name"
    t.string "client_email"
    t.string "telephone_number"
    t.string "nursing_number"
    t.string "date_of_day"
    t.datetime "client_birthday"
    t.date "worked_on"
    t.string "sex"
  end

  create_table "monitorings", force: :cascade do |t|
    t.datetime "monitoring_worked_on_year"
    t.datetime "monitoring_worked_on_month"
    t.string "monitoring_needs"
    t.string "monitoring_short_run_target"
    t.string "monitoring_service_adl"
    t.string "monitoring_exchange"
    t.string "monitoring_go_to_home"
    t.string "monitoring_go_to_home_buy"
    t.string "monitoring_walking"
    t.string "monitoring_eating"
    t.string "monitoring_situation_of_participation"
    t.string "monitoring_both"
    t.string "monitoring_both_truble"
    t.string "monitoring_changing_clothes"
    t.string "monitoring_community"
    t.string "monitoring_community_what"
    t.string "monitoring_situation_dey"
    t.string "monitoring_vacation_dey_buy"
    t.string "monitoring_attention"
    t.string "monitoring_service_need"
    t.string "monitoring_service_need_what"
    t.boolean "check_monitoring"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_monitorings_on_client_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "age"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.boolean "nurse", default: false
    t.boolean "counselor", default: false
    t.boolean "nursing_care_staff", default: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

end
