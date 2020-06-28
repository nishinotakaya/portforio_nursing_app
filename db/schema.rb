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

ActiveRecord::Schema.define(version: 20200624124645) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on" #日付
    t.datetime "started_at" #勤務開始時間
    t.datetime "finished_at" #勤務終了時間
    t.string "note" #備考
    t.datetime "plan_finished_at" #終了予定時間
    t.boolean "tomorrow" #翌日
    t.string "business_processing_contents" ##業務処理内容
    t.string "instructor_confirmation" #上長の名前
    t.string "overtime_status" #残業の状態      
    t.integer "user_id" #ユーザーID
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "office_number" #拠点番号
    t.string "office_name" #拠点名前
    t.string "office_modality" #拠点種類
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "department"
    t.datetime "basic_time", default: "2020-06-27 23:00:00"
    t.datetime "work_time", default: "2020-06-27 22:30:00"
    t.boolean "admin"
    t.boolean "superior", default: false
    t.string "employee_number"
    t.string "uid"
    t.datetime "designated_work_start_time", default: "2020-06-27 22:00:00"
    t.datetime "designated_work_end_time", default: "2020-06-28 09:00:00"
    t.string "user_id"
    t.datetime "basic_work_time", default: "2020-06-27 21:30:00"
    t.string "affiliation"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
