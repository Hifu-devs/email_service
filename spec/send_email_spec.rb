require './email_service.rb'
require 'spec_helper'

describe "My Sinatra Application" do
  include Rack::Test::Methods
  def app
    EmailService.new
  end

  it "test testing env" do
    get '/'
    expect(last_response).to be_ok
  end

  # it "should receive a post message and send an email to the emergency contact" do
  # # json = post body
  #   post '/email_alert', :data => json
  #   expect(last_response).to be_ok
  #   info = JSON.parse(last_response.body)
  #   expect(info.is_a? Hash).to eq(true)
  #   # expect(items.first["attributes"].has_key?("coordinates")).to eq(true)
  # end

end
