# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
require 'dotenv'
Dotenv.load

include SendGrid

class SendGridService

  def send_email(info)
    data = {
      personalizations: [
        dynamic_template_data: {
          contact_name: info.contact_name,
          person_name: info.person_name,
          person_age: info.person_age,
          person_address: info.person_address,
          person_phone: info.person_phone,
          person_gender: info.person_gender,
          person_blood_type: info.person_blood_type,
          sat_tracker: info.sat_tracker,
          person_allergies: info.person_allergies,
          person_medical_conditions: info.person_medical_conditions,
          person_heightCM: info.person_heightCM,
          person_weightKG: info.person_weightKG,
          end_time: info.end_time,
          start_time: info.start_time,
          activity: info.activity,
          party_size: info.party_size,
          notes: info.notes
        },
        to: [
          {
            email: "flewelling.margo@gmail.com",
            name: "margo"
          }]
        ],
    from: {
      email: "hifudev2001@gmail.com",
      name: "hifudevs"
    },
    template_id: "d-ad4aeb03a37c4b78970df5d14ff6bd22"
  }
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: data)
  puts response.status_code

    # mail = Mail.new
    # mail.template_id = 'd-ad4aeb03a37c4b78970df5d14ff6bd22'
    # to = Email.new(email: "flewelling.margo@gmail.com")
    # mail.from = Email.new(email: 'hifudev2001@gmail.com')
    # subject = "Emergency Alert Regarding #{info.person_name}"
    # mail.subject = subject
    # personalization = Personalization.new
    # personalization.add_to(Email.new(email: to, name: info.contact_name))
    # personalization.add_dynamic_template_data({
    #     "contact_name" => "TEST"
    #   })
    #   require "pry"; binding.pry
    # mail.add_personalization(personalization)

    # to = Email.new(email: "flewelling.margo@gmail.com")
    # from = Email.new(email: 'hifudev2001@gmail.com')
    # subject = "Emergency Alert Regarding #{info.person_name}"
    # content = Content.new(type: 'text/plain', value: info.message)
    # mail = Mail.new(from, subject, to, content)
    # Personalization.add_to(mail)
    # mail.add_personalization(personalization)
    # bodwy = mail.to_json

    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # require "pry"; binding.pry
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    # require "pry"; binding.pry
    # puts response.status_code
  end

end
