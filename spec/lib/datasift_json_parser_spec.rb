require 'datasift_json_parser'
require 'rails_helper'

RSpec.describe DatasiftJsonParser do

  it "should return the return a hash of values given valid json" do
    #json_content = File.read(Rails.root.join "spec/fixtures/datasift_sample.json")
    json_content = File.read("./spec/fixtures/datasift_sample.json")

    parsed_datasift_json = DatasiftJsonParser.return_datasift_interactions(json_content)

    first_interaction = parsed_datasift_json.first

    expect(parsed_datasift_json.count).to eq 2
    expect(first_interaction["interaction"]["author"]["username"]).to eq "asvprossi"
    expect(first_interaction["twitter"]["id"]).to eq "507107212880523264"

  end

  it "should return false when given an invalid json object" do
    parsed_datasift_json_with_errors = DatasiftJsonParser.return_datasift_interactions("this is a test")
    expect(parsed_datasift_json_with_errors).to eq "Invalid json! This json object has been logged to honeybadger"
  end

  it "should return the return a hash of values given valid json" do
    json_content = File.read("./spec/fixtures/datasift_sample.json")

    datasift_subscription_details = DatasiftJsonParser.return_subscription_details(json_content)

    expect(datasift_subscription_details[:datasift_stream_hash]).to eq "8909a77e95de7d0cfcedfd6ddf12c47a"

  end

  it "should return true if the interaction is a delete interaction" do
    json_content = File.read("./spec/fixtures/datasift_sample_delete.json")

    results = DatasiftJsonParser.is_interaction_delete?(json_content)

    expect(results).to eq true

  end


end