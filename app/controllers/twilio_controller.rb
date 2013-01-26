class TwilioController < ApplicationController

  def process_sms
    @rating = params[:Body]
    #if @rating == "10"
    #  render 'process_sms.xml.erb', :content_type => 'text/xml'
    #else
    #  render 'process_sms_fail.xml.erb', :content_type => 'text/xml'
    #end
    render 'process_sms.xml.erb', :content_type => 'text/xml'
  end

end