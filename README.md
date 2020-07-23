# Email microservice

## Email microservice for use of the HIFU App api

### Overview

  A RESTful sinatra microservice used by the [Hifu-api App](https://github.com/Hifu-devs/hifu-api/). Api calls to this microservice send an email an emergency contact using the Twilio/SendGrid api.

### Authors

- [Margo Flewelling](https://github.com/margoflewelling)
- [Krista Stadler](https://github.com/kristastadler)
- [Brian Greeson](https://github.com/brian-greeson)

### Local Setup

- Clone
- Bundle
- `ruby email_service.rb`
- All request are sent to `/`

### Production

- The production version of this microservice is deployed to [https://nameless-ravine-82701.herokuapp.com/]( https://nameless-ravine-82701.herokuapp.com/)

### Endpoints

- `/email_alert`
  - Request body example:

```json
{
  data:
  {
    user:
    {
      name: "John Doe",  
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
      contact:
      {
        name: "Jane Doe",  
        email: "jane@example.com",  
        phone: "233 333 3333"
      },  
      route:
      {
        start_time: "July 20 2020, 5 pm",  
        end_time: "July 27 2020, 7pm",  
        activity: "backpacking",  
        party_size: 1,  
        notes: "backpacking and fishing in mt zirkel wilderness"  
        waypoints:
        [
          {
            latitude: 40.23423, longitute: -102.32435
          },
          {
            latitude: 40.11345, longitute: -102.4934
          }
        ]
      }  
    }  
  }  
}
```

- Response
  - 200 Success, email was sent  
  - 400, Error, email not sent  
