class Info
  attr_reader :person_name, :person_email, :person_phone, :person_address,
              :person_age, :person_race, :person_gender, :sat_tracker,
              :person_blood_type, :person_allergies, :person_medical_conditions,
              :person_heightCM, :person_weightKG, :contact_name, :contact_email,
              :start_time, :end_time, :activity, :party_size, :notes, :waypoints

  def initialize(post_info)
    @person_name = post_info["data"]["user"]["name"]
    @person_email = post_info["data"]["user"]["email"]
    @person_phone = post_info["data"]["user"]["phone"]
    @person_address = post_info["data"]["user"]["address"]
    @person_age = post_info["data"]["user"]["age"]
    @person_race = post_info["data"]["user"]["race"]
    @person_gender = post_info["data"]["user"]["gender"]
    @sat_tracker = post_info["data"]["user"]["sat_tracker_address"]
    @person_blood_type = post_info["data"]["user"]["blood_type"]
    @person_allergies = post_info["data"]["user"]["allergies"]
    @person_medical_conditions = post_info["data"]["user"]["medical_conditions"]
    @person_heightCM = post_info["data"]["user"]["heightCM"]
    @person_weightKG = post_info["data"]["user"]["weightKG"]
    # contact
    @contact_name = post_info["data"]["user"]["contact"]["name"]
    @contact_email = post_info["data"]["user"]["contact"]["email"]
    # route
    @start_time = post_info["data"]["user"]["route"]["start_time"]
    @end_time = post_info["data"]["user"]["route"]["end_time"]
    @activity = post_info["data"]["user"]["route"]["activity"]
    @party_size = post_info["data"]["user"]["route"]["party_size"]
    @notes = post_info["data"]["user"]["route"]["notes"]
    @waypoints = post_info["data"]["user"]["route"]["waypoints"]
  end


end
