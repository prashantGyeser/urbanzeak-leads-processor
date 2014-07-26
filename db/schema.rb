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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140726121711) do

  create_table "leads", force: true do |t|
    t.string   "tweet_id"
    t.string   "tweet_poster_user_id"
    t.string   "tweet_poster_screen_name"
    t.string   "tweet_poster_profile_link"
    t.string   "tweet_poster_display_name"
    t.string   "tweet_user_image"
    t.text     "tweet_user_summary"
    t.integer  "tweet_user_friends_count"
    t.integer  "tweet_user_followers_count"
    t.datetime "tweet_post_time"
    t.text     "tweet_body"
    t.string   "user_location"
    t.string   "user_location_country_code"
    t.text     "gnip_matching_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_leads", force: true do |t|
    t.text     "tweet_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_non_leads", force: true do |t|
    t.text     "tweet_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unprocessed_leads", force: true do |t|
    t.string   "tweet_id"
    t.string   "tweet_poster_user_id"
    t.string   "tweet_poster_screen_name"
    t.string   "tweet_poster_profile_link"
    t.string   "tweet_poster_display_name"
    t.string   "tweet_user_image"
    t.text     "tweet_user_summary"
    t.integer  "tweet_user_friends_count"
    t.integer  "tweet_user_followers_count"
    t.datetime "tweet_post_time"
    t.text     "tweet_body"
    t.string   "user_location"
    t.string   "user_location_country_code"
    t.text     "gnip_matching_rules"
    t.boolean  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
