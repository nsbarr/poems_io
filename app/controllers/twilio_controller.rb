class TwilioController < ApplicationController

  def process_sms
    @rating = params[:body]
    if @rating == 10
      render 'process_sms.xml.erb', :content_type => 'text/xml'
    end
  end

end