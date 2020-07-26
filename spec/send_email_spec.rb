require './email_service.rb'
require 'spec_helper'

describe "My Sinatra Application" do
  include Rack::Test::Methods

    def app
      EmailService.new
    end

    it "should receive a post message and send an email to the emergency contact" do
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
                                  email: "flewelling.margo@gmail.com",
                                  phone: "233 333 3333" },
                       route: { start_time: "July 20 2020, 5 pm",
                                end_time: "July 27 2020, 7pm",
                                activity: "backpacking",
                                party_size: 1,
                                notes: "backpacking and fishing in mt zirkel wilderness",
                                waypoints: [{latitude: 40.784465, longitude: -106.721887},
                                            {latitude: 40.826558, longitude: -106.702631},
                                            {latitude: 40.758821, longitude: -106.694136}
                                           ]
                                },
                      local_authorities: { "name": "Lassen County Sheriff's Department",
                                           "phone_number": "(530) 257-6121" }
                       }
                  }
                }
        post '/email_alert', info.to_json
        expect(last_response).to be_ok
        expect(last_response.status).to equal(200)
        expect(last_response.body).to eq("Email sent successfully")
      end


      it "should not be able to send an email if no contact email field found" do
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
