class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /meetings
  # GET /meetings.json
  def index
    if current_user.admin?
      start_time = params[:start]
      end_time = params[:end]
      @events = Meeting.where("start_time >= ? AND end_time <= ?", start_time, end_time)
      @meetings = Meeting.where("start_time >= ? AND end_time <= ?", start_time, end_time)
  
      # @events = Meeting.all
      # @meetings = Meeting.all
    else
      @meetings = current_user.meetings #.where(user_id: current_user)
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @comment = Comment.new
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user


    respond_to do |format|
      if @meeting.save
        if current_user.admin?
          format.html { redirect_to backstage_bookings_path, notice: 'Meeting was successfully created.' }
          format.json { render :show, status: :created, location: @meeting }  
        end
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
meeting_params
    # guard clause for if end_time comes back nil from fullcalendar (yeah, it happens.  FIX: create a fix further upstream)
    puts "#### meeting_params ###"
    puts meeting_params
    mp = OpenStruct.new(meeting_params)
    puts "end_time is #{mp.end_time}  and its integer value is #{mp.end_time.to_i} "
    puts "#### meeting_params ###"

    
    respond_to do |format|
      if @meeting.update(meeting_params)
        if @meeting.end_time.blank?
          @meeting.end_time = @meeting.start_time + 2.seconds
          @meeting.save
        end
        if current_user.admin?
          format.html { redirect_to backstage_bookings_path, notice: 'Meeting was successfully updated.' }
          format.json { render :show, status: :created, location: @meeting }  
        end
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      if current_user.admin?
        format.html { redirect_to backstage_bookings_path, notice: 'Meeting was successfully destroyed.' }
        format.json { render :show, status: :created, location: @meeting }  
      end
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :all_day, :title)
    end
end
