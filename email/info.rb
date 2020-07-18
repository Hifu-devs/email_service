class Info

  def initialize(post_info)
    # @contact_name =
    # @contact_email =
    # @person_name =
    # @start_date =
    # @end_date =
    # @activity =
  end

  def message_template
    p "#{info.contact_name}, you were listed as an emergency contact for
    #{info.person_name}. #{info.person_name} left on a #{info.activity} trip on
    #{info.start_date} and expected to be back at #{info.end_date}.
    #{info.person_name} has not checked back in with us. Please reach out to
    check on them. If you can not get it touch with #{info.person_name} we
    recommend calling the police station near their last known location."
     # hopefully can incorporate local numbers here via api
     "Here is the relevant information that the police/first responders should be
     informed of:
     Name:
     Age:
     Address:
     Phone:
     Race:
     Gender:
     Sat Tracker Address:
     Blood Type:
     Allergies:
     Medical Conditions:
     Height(cm):
     Weight(kg):

     Trip Details
     Start time:
     Expected end time:
     activity:
     party size:
     Additional notes:

     Route Waypoints:
     Long:
     Lat:

     "

  end

end
