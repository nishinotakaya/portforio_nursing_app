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

  create_table "adl_checks", force: :cascade do |t|
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_adl_checks_on_client_id"
  end

  create_table "asesments", force: :cascade do |t|
    t.datetime "asesment_create_day"
    t.string "praxis_place"
    t.string "filling_up"
    t.string "why_assesment"
    t.string "family_name"
    t.string "family_joining"
    t.string "family_age"
    t.string "family_health"
    t.string "crying_email_name"
    t.string "crying_email_joining"
    t.string "crying_email_life"
    t.string "crying_call"
    t.datetime "first_time_reception"
    t.string "reception_method"
    t.string "reception_requester"
    t.string "counselling_route"
    t.string "life_history"
    t.string "life_now"
    t.string "trauma_old_people_adl"
    t.string "dementia_old_people_adl"
    t.datetime "nursing_number_day"
    t.string "nursing_number_duration"
    t.string "nursing_care_on_sickness_insurance"
    t.string "health_insurence"
    t.string "handicapped_notebook"
    t.string "livelihood_protection"
    t.string "nursing_care_service"
    t.string "nursing_care_service_call"
    t.string "nursing_care_service_content"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_asesments_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
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

  create_table "use_times", force: :cascade do |t|
    t.date "use_worked_on"
    t.date "use_worked_on_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
