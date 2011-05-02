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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110502205301) do

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_park"
    t.string   "credit"
  end

  create_table "eateries", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "when_to_go"
    t.string   "child_lunch_menu_url"
    t.string   "adult_dinner_menu_url"
    t.string   "wine_list"
    t.string   "dinner_hours"
    t.string   "child_breakfast_menu_url"
    t.string   "breakfast_hours"
    t.string   "adult_breakfast_menu_url"
    t.string   "requires_pre_payment"
    t.string   "dress"
    t.string   "overall_rating"
    t.string   "counter_quality_rating"
    t.string   "awards"
    t.string   "requires_credit_card"
    t.string   "category_code"
    t.string   "phone_number"
    t.string   "parking"
    t.string   "lunch_hours"
    t.string   "counter_value_rating"
    t.string   "child_dinner_menu_url"
    t.string   "cuisine"
    t.string   "bar"
    t.string   "thumbs_up"
    t.string   "table_quality_rating"
    t.string   "service_rating"
    t.string   "house_specialties"
    t.string   "extinct_on"
    t.string   "entree_range"
    t.string   "cost_code"
    t.string   "adult_lunch_menu_url"
    t.string   "table_value_rating"
    t.string   "opened_on"
    t.string   "friendliness_rating"
    t.string   "portion_size"
    t.integer  "district_id"
    t.string   "credit"
  end

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "menu_item_id"
    t.decimal  "default_price", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "eatery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
