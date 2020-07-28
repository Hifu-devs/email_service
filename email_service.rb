require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'
require './services/sendgrid_service'
require './poros/info'

class EmailService < Sinatra::Base

  get "/" do
    "HIFU email service"
  end

  post "/email_alert" do
    request_body = JSON.parse(request.body.string)
    info = Info.new(request_body)
    response  = SendGridService.new.send_email(info)
    if response.status_code == "202"
      response.body << "Email sent successfully"
    else
      response.body << "Error, email not sent"
    end
  end
end
