class PoemsController < ApplicationController
  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poems }
    end
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
    
    @poem = Poem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poem }
    end
  end

  # GET /poems/new
  # GET /poems/new.json
  def new
    
    @poem = Poem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poem }
    end
  end

  # GET /poems/1/edit
  def edit
    @poem = Poem.find(params[:id])
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = Poem.new(params[:poem])
    if @poem.save
          flash[:success] = "Poem created!"
          redirect_to root_url
        else
          render :action => 'new'        
        end
  end

  # PUT /poems/1
  # PUT /poems/1.json
  def update
    @poem = Poem.find(params[:id])

    respond_to do |format|
      if @poem.update_attributes(params[:poem])
        format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    respond_to do |format|
      format.html { redirect_to poems_url }
      format.json { head :no_content }
    end
  end
end
