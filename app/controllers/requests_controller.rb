class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
    @poem = @request.poems
    @newpoem = @request.poems.build
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @poem = Poem.new
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])
    user_id_int = @request.user_id
    @user = User.find(user_id_int)    
    @poem = @request.poems.build(params[:poem])

    number_to_send_to = @user.phone
    
    twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
    twilio_token = "cbb3471db9d83b61598159b5210404f1"
    twilio_phone_number = "6464900303"
    
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    

    if @poem.update_attributes(params[:content])
         poem_text = @poem.content
         @twilio_client.account.sms.messages.create(
           :from => "+1#{twilio_phone_number}",
           :to => number_to_send_to,
           :body => "#{poem_text}"
         )    
         # feedback request
        # @twilio_client.account.sms.messages.create(
        #    :from => "+1#{twilio_phone_number}",
        #    :to => number_to_send_to,
        #    :body => "Would you be so kind as to rate this poem from 1 (disappointing) to 10 (delightful)? Our poets are eager to improve."
        #  )
         redirect_to "/success"    
      else
        render 'edit'
      end
    end
 
  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
end
