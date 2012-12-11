class UsersController < ApplicationController
  # GET /users
  # GET /users.json  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  
  def new
    @user = User.new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  

  def create
    @user = User.find_or_create_by_phone(params[:user])
    @request = @user.requests.build(params[:request])
    
    if @user.save

       #Sends an email out when a user is created
       #UserMailer.request_alert(@user).deliver

       #Set up the Twilio stuff
       twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
       twilio_token = "cbb3471db9d83b61598159b5210404f1"
       twilio_phone_number = "6464900303"
       number_to_send_to = @user.phone
       theme = @request.conten
       id = @user.id
       url = "http://poems.io/users/#{id}/edit"
       #Rolls the dice to select a poet
       poet_to_send_to = ["9143934990","4782277137"].sample

       #Sends the request to the poet 

        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

        @twilio_client.account.sms.messages.create(
          :from => "+1#{twilio_phone_number}",
          :to => poet_to_send_to,
          :body => "Oh hey, won't you write someone a poem about #{theme}? You can do it here: #{url}"
        )


       #Sends a confirmation SMS to the user
        @twilio_client.account.sms.messages.create(
          :from => "+1#{twilio_phone_number}",
          :to => number_to_send_to,
          :body => "Thanks, I'm dreaming up your poem about #{theme}"
        )
        
        redirect_to :action => 'index'
      else
        render :action => 'new'
      end
  end
    

    #respond_to do |format|
    #  if @user.save
    #    format.html { redirect_to @user, notice: 'User was successfully created.' }
    #    format.json { render json: @user, status: :created, location: @user }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
  

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
