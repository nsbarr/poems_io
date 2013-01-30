ROOT_URL = 'http://poems-io.herokuapp.com'

twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
twilio_token = "cbb3471db9d83b61598159b5210404f1"
twilio_phone_number = "6464900303"

@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
