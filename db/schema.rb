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

ActiveRecord::Schema.define(version: 20200803102609) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "before_started_at"
    t.datetime "before_finished_at"
    t.datetime "edit_started_at"
    t.datetime "edit_finished_at"
    t.date "good_day"
    t.datetime "attended_time"
    t.string "note"
    t.datetime "plan_finished_at"
    t.datetime "over_time"
    t.boolean "tomorrow"
    t.string "business_processing_contents"
    t.boolean "change"
    t.string "instructor_confirmation"
    t.string "overtime_status"
    t.string "change_status"
    t.string "staff_one_month_attendance_status"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_attendances_on_staff_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.string "client_email"
    t.integer "telephone_number"
    t.string "nursing_number"
    t.string "date_of_day"
    t.string "client_disorder"
    t.integer "temperature"
    t.integer "affter_temperature"
    t.integer "vital"
    t.integer "pulse"
    t.boolean "bath"
    t.boolean "medicine"
    t.integer "food"
    t.datetime "client_birthday"
    t.string "monitoring_worked_on_year"
    t.string "monitoring_worked_on_month"
    t.string "monitoring_needs"
    t.string "monitoring_short_run_target"
    t.string "monitoring_service_adl"
    t.string "monitoring_exchange"
    t.string "monitoring_go_to_home"
    t.string "monitoring_go_to_home_no_reason"
    t.string "monitoring_walking"
    t.string "monitoring_eating"
    t.string "monitoring_situation_of_participation"
    t.string "monitoring_both"
    t.string "monitoring_both_skin_trouble"
    t.string "monitoring_changing_clothes"
    t.string "monitoring_community"
    t.string "monitoring_community_content"
    t.string "monitoring_situation_dey"
    t.string "monitoring_attention"
    t.string "monitoring_service_need"
  end

  create_table "offices", force: :cascade do |t|
    t.string "office_number"
    t.string "office_name"
    t.string "office_modality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "basic_time", default: "2020-08-04 23:00:00"
    t.datetime "work_time", default: "2020-08-04 22:30:00"
    t.boolean "admin"
    t.string "employee_number"
    t.string "uid"
    t.datetime "designated_work_start_time", default: "2020-08-04 22:00:00"
    t.datetime "designated_work_end_time", default: "2020-08-05 09:00:00"
    t.string "staff_id"
    t.datetime "basic_work_time", default: "2020-08-04 21:30:00"
    t.string "affiliation"
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
