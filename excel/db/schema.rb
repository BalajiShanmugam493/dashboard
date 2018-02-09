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

ActiveRecord::Schema.define(version: 20180209203652) do

  create_table "itemdetails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "itemID"
    t.date "Date"
    t.string "accessionItemNo"
    t.string "journalSequence"
    t.string "publicationYear"
    t.string "documentType"
    t.string "pageSpan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itemqueuedetails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "itemQueueDetailsID"
    t.integer "itemID"
    t.integer "queueStatusID"
    t.integer "userID"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.date "released_on"
    t.decimal "price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userrolemaps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "userMapRoleID"
    t.integer "mapUserID"
    t.integer "mapRoleID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
