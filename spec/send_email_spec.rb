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
                                notes: "backpacking and fishing in mt zirkel wilderness" }
                             # need to add waypoints here}
                       }
                  }
                }
        post '/email_alert', info.to_json
        require "pry"; binding.pry
        # expect(last_response).to be_ok
        # expect(last_response.status).to equal(200)
      end

end
