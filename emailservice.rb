require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'
require 'dotenv'
Dotenv.load

class Emailservice < Sinatra::Base

  post '/send_email' do
    # imagine receiving info in post body to extract.
    # go to services/twilio.rb to send an email. 
    # send some sort of response back to hifu api
  end

end
