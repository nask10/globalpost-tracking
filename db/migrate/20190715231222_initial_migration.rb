class InitialMigration < ActiveRecord::Migration[5.2]
  def change
  
    create_table "addresses", force: :cascade do |t|
      t.string "street"
      t.string "ext_number"
      t.string "int_number"
      t.string "city"
      t.string "country"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "zip_code"
    end  
  
    create_table "parcels", force: :cascade do |t|
      t.integer "user_id"
      t.string "tracking_code"
      t.integer "origin_address_id"
      t.integer "destination_address_id"
      t.string "receiver_name"
      t.string "receiver_phone"
      t.string "receiver_email"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "status"
      t.index ["user_id"], name: "index_parcels_on_user_id"
    end
  
    create_table "track_events", force: :cascade do |t|
      t.integer "parcel_id"
      t.string "location"
      t.string "description"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["parcel_id"], name: "index_track_events_on_parcel_id"
    end  
  end
end
