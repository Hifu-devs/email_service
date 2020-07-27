require './email_service.rb'
require 'spec_helper'

describe "My Sinatra Application" do
  include Rack::Test::Methods

    def app
      EmailService.new
    end

    it "should receive a post message and send an email to the emergency contact" do
      info = "{\"data\":{\"id\":\"334\",\"type\":\"email_info\",\"attributes\":{\"activity\":\"backpacking\",\"party_size\":8,\"notes\":\"Hiking and Fishing in the Mt Zirkel Wilderness.\",\"start_time\":\"2020-07-27T18:12:35.859Z\",\"end_time\":\"2020-07-27T12:12:00.000Z\",\"user\":{\"data\":{\"id\":\"345\",\"type\":\"user\",\"attributes\":{\"name\":\"Tynisha Jerde\",\"email\":\"velma.turcotte@konopelski-ward.name\",\"phone\":\"172.640.9839\",\"address\":\"Suite 900 4575 Pagac Circles, Anamariastad, KY 45156\",\"age\":81,\"race\":\"Hispanic\",\"gender\":\"Female\",\"sat_tracker_address\":\"4354632346\",\"blood_type\":\"O\",\"allergies\":\"peanuts\",\"medical_conditions\":\"pitchforkitis\",\"heightCM\":55,\"weightKG\":93}}},\"contact\":{\"data\":{\"id\":\"274\",\"type\":\"contact\",\"attributes\":{\"name\":\"Gabby TEST FORMAT\",\"email\":\"flewelling.margo@gmail.com\"}}},\"waypoints\":{\"data\":[{\"id\":\"507\",\"type\":\"waypoints\",\"attributes\":{\"latitude\":40.3453,\"longitude\":-120.3642}}]},\"local_authority_name\":\"Lassen County Sheriff's Department\",\"local_authority_phone\":\"(530) 257-6121\"},\"relationships\":{\"waypoints\":{\"data\":[{\"id\":\"507\",\"type\":\"waypoint\"}]},\"contact\":{\"data\":{\"id\":\"274\",\"type\":\"contact\"}},\"user\":{\"data\":{\"id\":\"345\",\"type\":\"user\"}}}}}"
        post '/email_alert', info
        expect(last_response).to be_ok
        expect(last_response.status).to equal(200)
        expect(last_response.body).to eq("Email sent successfully")
      end


      it "should not be able to send an email if no contact email field found" do
          info = {"data"=>
                  {"id"=>"334",
                   "type"=>"email_info",
                   "attributes"=>
                    {"activity"=>"backpacking",
                     "party_size"=>8,
                     "notes"=>"Hiking and Fishing in the Mt Zirkel Wilderness.",
                     "start_time"=>"2020-07-27T18:12:35.859Z",
                     "end_time"=>"2020-07-27T12:12:00.000Z",
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
                           "medical_conditions"=>"pitchforkitis",
                           "heightCM"=>55,
                           "weightKG"=>93}}},
                     "contact"=>{"data"=>{"id"=>"274", "type"=>"contact", "attributes"=>{"name"=>"Jane Doe", "email"=>""}}},
                     "waypoints"=>{"data"=>[{"id"=>"507", "type"=>"waypoints", "attributes"=>{"latitude"=>40.3453, "longitude"=>-120.3642}}]},
                     "local_authority_name"=>"Lassen County Sheriff's Department",
                     "local_authority_phone"=>"(530) 257-6121"},
                   "relationships"=>
                    {"waypoints"=>{"data"=>[{"id"=>"507", "type"=>"waypoint"}]}, "contact"=>{"data"=>{"id"=>"274", "type"=>"contact"}}, "user"=>{"data"=>{"id"=>"345", "type"=>"user"}}}}}
          post '/email_alert', info.to_json
          expect(last_response).to be_ok
          expect(last_response.body).to include("Does not contain a valid address")
        end

        xit "should be able to send an email even if some fields are missing" do
          info = { data:
                 { user: { name: "John Doe",
                           email: "john@example.com",
                           phone: "222 224 2222",
                           address: "123 hifu ln, denver co, 80210",
                           age: 33,
                           race: "white",
                           gender: "male",
                           sat_tracker_address: "1242354235",
                           blood_type: "O neg",
                           allergies: "peanuts",
                           medical_conditions: "none",
                           heightCM: 183,
                           weightKG: 73,
                           contact: { name: "Jane Doe",
                                      email: "",
                                      phone: "233 333 3333" },
                           route: { start_time: "July 20 2020, 5 pm",
                                    end_time: "July 27 2020, 7pm",
                                    activity: "backpacking",
                                    party_size: 1,
                                    notes: "backpacking and fishing in mt zirkel wilderness",
                                    waypoints: [{latitute: 40.784465, longitute: -106.721887},
                                                {latitute: 40.826558, longitute: -106.702631},
                                                {latitute: 40.758821, longitute: -106.694136}
                                               ]
                                    },
                            local_authorities: { "name": "Lassen County Sheriff's Department",
                                                         "phone_number": "(530) 257-6121" }
                           }
                      }
                    }
            post '/email_alert', info.to_json
            expect(last_response).to be_ok
            expect(last_response.body).to include("Does not contain a valid address")
          end



end
