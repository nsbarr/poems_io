class TwilioController < ApplicationController

  def process_sms
    @rating = params[:Body]
    #Find the poem for this user's latest request
    #Poem.rating = @rating
    if @rating == "10"
      render 'process_sms.xml.erb', :content_type => 'text/xml'
    else
      render 'process_sms_fail.xml.erb', :content_type => 'text/xml'
    end
  end
  
  def smslog
  twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
  twilio_token = "cbb3471db9d83b61598159b5210404f1"
  @client = Twilio::REST::Client.new twilio_sid, twilio_token    
  @message = @client.account.sms.messages.list
  end
end