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

ActiveRecord::Schema.define(version: 20200829203607) do

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
    t.boolean "check_a", default: false, null: false
    t.datetime "asesment_create_year"
    t.boolean "whrite_year"
    t.string "prosthsis_up"
    t.string "prosthsis_down"
    t.boolean "prosthss_up"
    t.boolean "prosthss_down"
    t.index ["client_id"], name: "index_asesments_on_client_id"
  end

  create_table "businesslogs", force: :cascade do |t|
    t.datetime "log_year"
    t.datetime "log_month"
    t.datetime "log_day"
    t.datetime "log_week"
    t.string "log_farewell"
    t.string "log_bath"
    t.string "log_food"
    t.string "log_good_staple_dosage"
    t.string "log_good_side_dosage"
    t.string "log_body_temperature"
    t.string "log_pressure_up"
    t.string "log_pressure_down"
    t.string "log_pulse"
    t.string "re_log_pressure_up"
    t.string "re_log_pressure_down"
    t.string "re_log_body_temperature"
    t.string "re_log_pulse"
    t.string "log_hand_washing"
    t.string "log_brush_teeth"
    t.string "log_special_mention"
    t.string "log_record_stamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "check_log"
    t.string "log_bath_machine"
    t.boolean "log_foods"
    t.boolean "log_check_return"
    t.boolean "check_log_hand_washing"
    t.boolean "check_log_brush_teeth"
    t.date "log_worked_on"
    t.integer "client_id"
    t.boolean "business_log_use_check"
    t.index ["client_id"], name: "index_businesslogs_on_client_id"
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
    t.boolean "use_check"
  end

  create_table "foodcooks", force: :cascade do |t|
    t.date "food_worked_on"
    t.boolean "staff_food"
    t.boolean "client_food"
    t.string "food_note"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "food_sience"
    t.string "food_staff"
    t.boolean "food_staff_1"
    t.boolean "food_staff_2"
    t.boolean "food_staff_3"
    t.boolean "food_staff_4"
    t.boolean "food_staff_5"
    t.boolean "food_staff_6"
    t.boolean "food_staff_7"
    t.boolean "food_staff_8"
    t.boolean "food_staff_9"
    t.index ["client_id"], name: "index_foodcooks_on_client_id"
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

  create_table "nurselogs", force: :cascade do |t|
    t.string "nurse_body_temperature"
    t.string "nurse_body_temperature_after"
    t.string "nurse_pressure_up"
    t.string "nurse_pulse"
    t.boolean "nurse_both_ok"
    t.boolean "nurse_both_noshing"
    t.boolean "nurse_both_no"
    t.boolean "nurse_both_little"
    t.boolean "nurse_medicine_my"
    t.boolean "nurse_medicine_yes"
    t.boolean "nurse_medicine_after"
    t.string "nurse_food_main"
    t.string "nurse_food_sub"
    t.boolean "nurse_medicine_check"
    t.string "nurse_note"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "nurse_worked_on"
    t.string "nurse_pressure_down"
    t.string "nurse_both"
    t.string "nurse_medicine"
    t.index ["client_id"], name: "index_nurselogs_on_client_id"
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
