require 'bayesian_classifier'
require 'rails_helper'

# Todo: Fix the issue where this test cannot be run when delayed_job is enabled in the class

RSpec.describe BayesianClassifier do
  it "should classify the tweets given a valid unprocessed lead from datasift" do

    common_id = Faker::Lorem.characters(10)
    city = create(:city)
    category = Category.create(name: "Asian")
    datasift_subscription = create(:datasift_subscription, datasift_subscription_id: common_id, city_id: city.id, category_id: category.id)
    FactoryGirl.create(:unprocessed_lead, datasift_stream_hash: common_id, subscription_id: common_id)

    bayesian_classifier = BayesianClassifier.new
    bayesian_classifier.process_all_unprocessed_leads

    expect(NonLeadTweetInCity.count).to eq 1

  end

  it "should classify tweets with a mix of tweets from datasift and twitter api" do

    common_id = Faker::Lorem.characters(10)
    user = create(:user)

    city = create(:city)
    category = Category.create(name: "Asian")
    datasift_subscription = create(:datasift_subscription, datasift_subscription_id: common_id, city_id: city.id, category_id: category.id)

    create(:unprocessed_lead, tweet_id: Faker::Lorem.characters(7), subscription_id: common_id )
    create(:unprocessed_lead, user_id: user.id, tweet_id: Faker::Lorem.characters(7))

    bayesian_classifier = BayesianClassifier.new
    bayesian_classifier.process_all_unprocessed_leads

    non_lead_tweet_with_user = NonLeadTweetInCity.where.not(user_id: nil).first
    expect(NonLeadTweetInCity.count).to eq 2
    expect(non_lead_tweet_with_user[:user_id]).to eq user.id
  end

  it "should add the tweet to the leads in case it contains a keyword" do
    common_id = Faker::Lorem.characters(10)
    city = create(:city)
    category = Category.create(name: "Asian")
    datasift_subscription = create(:datasift_subscription, datasift_subscription_id: common_id, city_id: city.id, category_id: category.id)
    FactoryGirl.create(:unprocessed_lead, datasift_stream_hash: common_id, subscription_id: common_id, tweet_body: "I need some sushi")

    bayesian_classifier = BayesianClassifier.new
    bayesian_classifier.process_all_unprocessed_leads

    expect(Lead.count).to eq 1
  end

end