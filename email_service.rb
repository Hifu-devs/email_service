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
    # request.body.read
    # take in params/body and create info object to populate form
    # info = Info.new(request.body)
    # SendGridService.new.send_email(info)
    # send email via sendgrid service
    require "pry"; binding.pry
  end
end

# run EmailService.run!
