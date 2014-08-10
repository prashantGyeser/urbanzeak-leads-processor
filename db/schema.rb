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

ActiveRecord::Schema.define(version: 20140810094233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "importer_errors", force: true do |t|
    t.string   "file_name"
    t.text     "error_message_generated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "importer_statuses", force: true do |t|
    t.string   "file_name"
    t.integer  "number_of_rows_imported"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: true do |t|
    t.string   "tweet_poster_screen_name"
    t.string   "tweet_poster_profile_link"
    t.string   "tweet_user_image"
    t.text     "tweet_body"
    t.string   "user_location"
    t.text     "gnip_matching_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "non_lead_tweet_in_cities", force: true do |t|
    t.string   "tweet_poster_screen_name"
    t.string   "tweet_user_image"
    t.text     "tweet_body"
    t.string   "user_location"
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

  create_table "tweets", force: true do |t|
    t.text     "body"
    t.integer  "twitter_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_oauth_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_users", force: true do |t|
    t.string   "screen_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unchecked_leads", force: true do |t|
    t.string   "tweet_poster_screen_name"
    t.string   "tweet_user_image"
    t.text     "tweet_body"
    t.string   "user_location"
    t.text     "gnip_matching_rules"
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

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
