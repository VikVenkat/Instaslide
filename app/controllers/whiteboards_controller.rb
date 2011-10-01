class WhiteboardsController < ApplicationController

  # Use Paperclip to attach a file
  def upload
  end
  
  # Send file to Turk
  def submit
    RTurk.setup(AKIAJETT5WWWOMFUITCQ, h6khH304Eb/VEqs4DujJ6VfsI0kzYuUsnCXw7U+0, :sandbox => true)
    hit = RTurk::Hit.create(:title => "Create a powerpoint slide based on a picture") do |hit|

    hit.description = 'Given an image of a whiteboard diagram, extract images and diagram elements and create a quick powerpoint slide.'
# 	not sure if this is a real thing
    hit.keywords = 'image, slide, powerpoint, whiteboard, text, diagram'

#    hit.question("http://myapp.com/turkers/add_tags",
#                 :frame_height => 1000)  # pixels for iframe
    hit.reward = 0.25
    hit.assignments = 1
    hit.qualifications.add :approval_rate, { :gt => 90 }
    end
  end


  # GET /whiteboards
  # GET /whiteboards.xml
  def index
    @whiteboards = Whiteboard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @whiteboards }
    end
  end

  # GET /whiteboards/1
  # GET /whiteboards/1.xml
  def show
    @whiteboard = Whiteboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @whiteboard }
    end
  end

  # GET /whiteboards/new
  # GET /whiteboards/new.xml
  def new
    @whiteboard = Whiteboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @whiteboard }
    end
  end

  # GET /whiteboards/1/edit
  def edit
    @whiteboard = Whiteboard.find(params[:id])
  end

  # POST /whiteboards
  # POST /whiteboards.xml
  def create
    @whiteboard = Whiteboard.new(params[:whiteboard])

    respond_to do |format|
      if @whiteboard.save
        format.html { redirect_to(@whiteboard, :notice => 'Whiteboard was successfully created.') }
        format.xml  { render :xml => @whiteboard, :status => :created, :location => @whiteboard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @whiteboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /whiteboards/1
  # PUT /whiteboards/1.xml
  def update
    @whiteboard = Whiteboard.find(params[:id])

    respond_to do |format|
      if @whiteboard.update_attributes(params[:whiteboard])
        format.html { redirect_to(@whiteboard, :notice => 'Whiteboard was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @whiteboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /whiteboards/1
  # DELETE /whiteboards/1.xml
  def destroy
    @whiteboard = Whiteboard.find(params[:id])
    @whiteboard.destroy

    respond_to do |format|
      format.html { redirect_to(whiteboards_url) }
      format.xml  { head :ok }
    end
  end
end
