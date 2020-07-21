## Email microservice for use of the HIFU App api
  Hifu Api calls to this microservice to send an email to
  the emergency contact using Twilio/SendGrid

### Endpoint to send emails to emergency contact
Post to https://nameless-ravine-82701.herokuapp.com/email_alert
Post body should be formatted in the following nested structure:

  { data:
  { user:
          contact: {
          }
          route: {
            waypoints: {

            }
          }
    }}}


### Example post request body

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
                            email: "jane@example.com",
                            phone: "233 333 3333" },
                 route: { start_time: "July 20 2020, 5 pm",
                          end_time: "July 27 2020, 7pm",
                          activity: "backpacking",
                          party_size: 1,
                          notes: "backpacking and fishing in mt zirkel wilderness"
                          waypoints: {
                            }}

                 }
            }
          }

Response codes: 200 Success, email was sent
                400, Error, email not sent

Developers: Margo Flewelling, Krista Stadler, Brian Greeson
