require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'
require 'dotenv'

class Emailservice < Sinatra::Base

  post '/email_alert' do
    # take in params/body and create user object to populate form
    # send email via sendgrid service
    require "pry"; binding.pry
  end
end
