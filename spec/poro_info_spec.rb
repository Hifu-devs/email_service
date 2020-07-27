require './email_service.rb'
require 'spec_helper'

describe "My Sinatra Application" do
  include Rack::Test::Methods

    def app
      EmailService.new
    end

    it "should get the correct data from the post body and safe it into an info object" do
      post_info = {"data"=>
                  {"user"=>
                    {"name"=>"John Doe",
                     "email"=>"john@example.com",
                     "phone"=>"222 224 2222",
                     "address"=>"123 hifu ln, denver co, 80210",
                     "age"=>33,
                     "race"=>"white",
                     "gender"=>"male",
                     "sat_tracker_address"=>"1242354235",
                     "blood_type"=>"O neg",
                     "allergies"=>"peanuts",
                     "medical_conditions"=>"none",
                     "heightCM"=>183,
                     "weightKG"=>73,
                     "contact"=>{"name"=>"Jane Doe", "email"=>"flewelling.margo@gmail.com", "phone"=>"233 333 3333"},
                     "route"=>
                      {"start_time"=>"July 20 2020, 5 pm",
                       "end_time"=>"July 27 2020, 7pm",
                       "activity"=>"backpacking",
                       "party_size"=>1,
                       "notes"=>"backpacking and fishing in mt zirkel wilderness",
                       "waypoints"=>[{"latitude"=>40.784465, "longitude"=>-106.721887}, {"latitude"=>40.826558, "longitude"=>-106.702631}, {"latitude"=>40.758821, "longitude"=>-106.694136}]},
                     "local_authorities"=>{"name"=>"Lassen County Sheriff's Department", "phone_number"=>"(530) 257-6121"}}}}

        info = Info.new(post_info)
        expect(info.person_name).to eq("John Doe")
        expect(info.person_email).to eq("john@example.com")
        expect(info.person_phone).to eq("222 224 2222")
        expect(info.person_address).to eq("123 hifu ln, denver co, 80210")
        expect(info.person_age).to eq(33)
        expect(info.person_race).to eq("white")
        expect(info.person_gender).to eq("male")
        expect(info.sat_tracker).to eq("1242354235")
        expect(info.person_blood_type).to eq("O neg")
        expect(info.person_allergies).to eq("peanuts")
        expect(info.person_medical_conditions).to eq("none")
        expect(info.person_heightCM).to eq(183)
        expect(info.person_weightKG).to eq(73)
        expect(info.contact_name).to eq("Jane Doe")
        expect(info.contact_email).to eq("flewelling.margo@gmail.com")
        expect(info.start_time).to eq("July 20 2020, 5 pm")
        expect(info.end_time).to eq("July 27 2020, 7pm")
        expect(info.activity).to eq("backpacking")
        expect(info.party_size).to eq(1)
        expect(info.notes).to eq("backpacking and fishing in mt zirkel wilderness")
        expect(info.waypoints.length).to eq(3)
        expect(info.local_authority_name).to eq("Lassen County Sheriff's Department")
        expect(info.local_authority_phone).to eq("(530) 257-6121")
  end


end
