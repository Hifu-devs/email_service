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
    require "pry"; binding.pry
    SendGridService.new.send_email(info)
    # if email_status == ("200" || "202")
    #   require "pry"; binding.pry
    #   render :status => :created, json: { message: "Email sent to #{info.contact_name}"}
    # else
    #   message = user.errors.full_messages.to_sentence
    #   render :status => 400, json: { message: message }
    # end
  end
end
