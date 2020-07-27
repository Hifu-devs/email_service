class Info
  attr_reader :person_name, :person_email, :person_phone, :person_address,
              :person_age, :person_race, :person_gender, :sat_tracker,
              :person_blood_type, :person_allergies, :person_medical_conditions,
              :person_heightCM, :person_weightKG, :contact_name, :contact_email,
              :start_time, :end_time, :activity, :party_size, :notes, :waypoints,
              :local_authority_name, :local_authority_phone

  def initialize(post_info)
    person = post_info["data"]["attributes"]["user"]["data"]["attributes"]
    @person_name = person["name"]
    @person_email = person["email"]
    @person_phone = person["phone"]
    @person_address = person["address"]
    @person_age = person["age"]
    @person_race = person["race"]
    @person_gender = person["gender"]
    @sat_tracker = person["sat_tracker_address"]
    @person_blood_type = person["blood_type"]
    @person_allergies = person["allergies"]
    @person_medical_conditions = person["medical_conditions"]
    @person_heightCM = person["heightCM"]
    @person_weightKG = person["weightKG"]
    # contact
    @contact_name = post_info["data"]["attributes"]["contact"]["data"]["attributes"]["name"]
    @contact_email = post_info["data"]["attributes"]["contact"]["data"]["attributes"]["email"]
    # route
    @start_time = post_info["data"]["attributes"]["start_time"]
    @end_time = post_info["data"]["attributes"]["end_time"]
    @activity = post_info["data"]["attributes"]["activity"]
    @party_size = post_info["data"]["attributes"]["party_size"]
    @notes = post_info["data"]["attributes"]["notes"]
    @waypoints = post_info["data"]["attributes"]["waypoints"]["data"]
    @local_authority_name = post_info["data"]["attributes"]["local_authority_name"]
    @local_authority_phone = post_info["data"]["attributes"]["local_authority_phone"]
  end

end
