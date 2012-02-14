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

ActiveRecord::Schema.define(:version => 20120214073346) do

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "department"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lat",        :precision => 15, :scale => 10
    t.decimal  "lon",        :precision => 15, :scale => 10
  end

  create_table "violence_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "violences", :force => true do |t|
    t.integer  "location_id"
    t.integer  "actor_id"
    t.integer  "violence_type_id"
    t.integer  "year_of"
    t.integer  "death_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "violences", ["actor_id"], :name => "fk_violences_actors"
  add_index "violences", ["location_id"], :name => "fk_violences_locations"
  add_index "violences", ["violence_type_id"], :name => "fk_violences_types"

  create_table "violencia", :force => true do |t|
    t.string  "departamento", :limit => 20
    t.string  "municipio",    :limit => 50
    t.string  "organizacion", :limit => 5
    t.string  "tipo",         :limit => 22
    t.integer "ano"
    t.integer "muertes"
    t.integer "place_id"
  end

end
