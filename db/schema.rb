# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120709132439) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "makes", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "makes", ["category_id"], :name => "index_makes_on_category_id"

  create_table "models", :force => true do |t|
    t.string   "name"
    t.integer  "make_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "models", ["make_id"], :name => "index_models_on_make_id"

  create_table "part_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "part_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "parts", ["part_group_id"], :name => "index_parts_on_part_group_id"

  create_table "vehicle_parts", :force => true do |t|
    t.integer  "part_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vehicle_parts", ["part_id"], :name => "index_vehicle_parts_on_part_id"
  add_index "vehicle_parts", ["vehicle_id"], :name => "index_vehicle_parts_on_vehicle_id"

  create_table "vehicles", :force => true do |t|
    t.string   "body_type"
    t.integer  "power"
    t.integer  "capacity"
    t.integer  "year_from"
    t.integer  "year_to"
    t.integer  "make_id"
    t.integer  "model_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vehicles", ["make_id"], :name => "index_vehicles_on_make_id"
  add_index "vehicles", ["model_id"], :name => "index_vehicles_on_model_id"

end
