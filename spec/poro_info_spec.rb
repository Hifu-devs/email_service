require './email_service.rb'
require 'spec_helper'

describe "My Sinatra Application" do
  include Rack::Test::Methods

    def app
      EmailService.new
    end

    it "should get the correct data from the post body and safe it into an info object" do
      post_info = {"data"=>
                  {"id"=>"334",
                   "type"=>"email_info",
                   "attributes"=>
                    {"activity"=>"backpacking",
                     "party_size"=>1,
                     "notes"=>"Hiking and Fishing in the Mt Zirkel Wilderness.",
                     "start_time"=>"2020-07-28T22:26:10.430Z",
                     "end_time"=>"2020-07-28T22:26:10.430Z",
                     "user"=>
                      {"data"=>
                        {"id"=>"345",
                         "type"=>"user",
                         "attributes"=>
                          {"name"=>"Tynisha Jerde",
                           "email"=>"velma.turcotte@konopelski-ward.name",
                           "phone"=>"172.640.9839",
                           "address"=>"Suite 900 4575 Pagac Circles, Anamariastad, KY 45156",
                           "age"=>81,
                           "race"=>"Hispanic",
                           "gender"=>"Female",
                           "sat_tracker_address"=>"4354632346",
                           "blood_type"=>"O",
                           "allergies"=>"peanuts",
                           "medical_conditions"=>"none",
                           "heightCM"=>183,
                           "weightKG"=>73}}},
                     "contact"=>{"data"=>{"id"=>"274", "type"=>"contact", "attributes"=>{"name"=>"Jane Doe", "email"=>"flewelling.margo@gmail.com"}}},
                     "waypoints"=>{"data"=>[{"id"=>"507", "type"=>"waypoints", "attributes"=>{"latitude"=>40.3453, "longitude"=>-120.3642}}]},
                     "local_authority_name"=>"Lassen County Sheriff's Department",
                     "local_authority_phone"=>"(530) 257-6121"},
                   "relationships"=>
                    {"waypoints"=>{"data"=>[{"id"=>"507", "type"=>"waypoint"}]}, "contact"=>{"data"=>{"id"=>"274", "type"=>"contact"}}, "user"=>{"data"=>{"id"=>"345", "type"=>"user"}}}}}

        info = Info.new(post_info)
        expect(info.person_name).to eq("Tynisha Jerde")
        expect(info.person_email).to eq("velma.turcotte@konopelski-ward.name")
        expect(info.person_phone).to eq("172.640.9839")
        expect(info.person_address).to eq("Suite 900 4575 Pagac Circles, Anamariastad, KY 45156")
        expect(info.person_age).to eq(81)
        expect(info.person_race).to eq("Hispanic")
        expect(info.person_gender).to eq("Female")
        expect(info.sat_tracker).to eq("4354632346")
        expect(info.person_blood_type).to eq("O")
        expect(info.person_allergies).to eq("peanuts")
        expect(info.person_medical_conditions).to eq("none")
        expect(info.person_heightCM).to eq(183)
        expect(info.person_weightKG).to eq(73)
        expect(info.contact_name).to eq("Jane Doe")
        expect(info.contact_email).to eq("flewelling.margo@gmail.com")
        expect(info.start_time).to eq("2020-07-28T22:26:10.430Z")
        expect(info.end_time).to eq("2020-07-28T22:26:10.430Z")
        expect(info.activity).to eq("backpacking")
        expect(info.party_size).to eq(1)
        expect(info.notes).to eq("Hiking and Fishing in the Mt Zirkel Wilderness.")
        expect(info.waypoints.length).to eq(1)
        expect(info.local_authority_name).to eq("Lassen County Sheriff's Department")
        expect(info.local_authority_phone).to eq("(530) 257-6121")
  end


end
