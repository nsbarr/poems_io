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
  @client = Twilio::REST::Client.new twilio_sid, twilio_token    
  @message = @client.account.sms.messages.list
  end
end