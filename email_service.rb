require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'
require './services/sendgrid_service'
require './poros/info'


class EmailService < Sinatra::Base

  get "/" do
    "hi"
  end

  post "/email_alert" do
    request_body = JSON.parse(request.body.string)
    info = Info.new(request_body)
    SendGridService.new.send_email(info)
    # require "pry"; binding.pry
    # if info.save
    #   require "pry"; binding.pry
    #   render :status => :created, json: { message: "Email send to #{info.contact_name}"}
    # else
    #   message = user.errors.full_messages.to_sentence
    #   render :status => 400, json: { message: message }
    # end
  end
end
