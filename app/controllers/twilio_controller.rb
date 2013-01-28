class TwilioController < ApplicationController

  def process_sms
    @rating = params[:Body]
    @user = User.find_or_create_by_phone(params[:user])
    #Find the poem for this user's latest request
    Poem.rating = @rating
    if @rating == "10"
      render 'process_sms.xml.erb', :content_type => 'text/xml'
    else
      render 'process_sms_fail.xml.erb', :content_type => 'text/xml'
    end
  end

end