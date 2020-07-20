# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
require 'dotenv'
Dotenv.load

include SendGrid

class SendGridService

  def send_email(info)
    from = Email.new(email: 'hifudev2001@gmail.com')
    to = Email.new(email: info.contact_email)
    subject = "Emergency Alert Regarding #{info.person_name}"
    content = Content.new(type: 'text/plain', value: info.message)
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

end
