class Backstage::BookingsController < ApplicationController
  layout 'backstage'
  before_action :set_meeting_room, only: %i[show edit update destroy]

  # GET /meeting_rooms or /meeting_rooms.json
  def index
    @meeting_rooms = MeetingRoom.all
    @meeting_room = MeetingRoom.first
  end

  # GET /meeting_rooms/1 or /meeting_rooms/1.json
  def show; end

  # GET /meeting_rooms/new
  def new
    @meeting_room = MeetingRoom.new
  end

  # GET /meeting_rooms/1/edit
  def edit; end

  # POST /meeting_rooms or /meeting_rooms.json
  def create
    @meeting_room = MeetingRoom.new(meeting_room_params)

    respond_to do |format|
      if @meeting_room.save
        format.html { redirect_to @meeting_room, notice: 'Meeting room was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_rooms/1 or /meeting_rooms/1.json
  def update
    respond_to do |format|
      if @meeting_room.update(meeting_room_params)
        format.html { redirect_to @meeting_room, notice: 'Meeting room was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_rooms/1 or /meeting_rooms/1.json
  def destroy
    @meeting_room.destroy
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_booking
    room = MeetingRoom.find(params[:meeting_room_id])
    slot = Time.zone.parse(params[:time])
    slot_to_book = room.schedule
                       .occurrences(3.week.from_now)
                       .detect { |occ| occ.beginning_of_hour.localtime == slot.localtime }
    active_booking = current_user.bookings.find_all { |booking| booking[:time] > (DateTime.now - 5.hours) }
    if active_booking.length < 2
      begin
        current_user.book! room, time: slot_to_book, amount: 1
        flash[:notice] = "You have a booking #{slot.to_formatted_s(:short)}. Smell the rainbows!"
        redirect_to meeting_rooms_path
      rescue ActsAsBookable::AvailabilityError => e
        redirect_to meeting_rooms_path, notice: e.message.underscore.humanize
      end
    else
      flash[:alert] = 'You may only have two active bookings.'
      redirect_to meeting_rooms_path
    end
  end

  def delete_booking
    active_booking = current_user.bookings.detect { |booking| booking.time == Time.zone.parse(params[:time]) }
    active_booking.delete
    flash[:notice] = 'You have successfully cancelled your booking.'
    redirect_to meeting_rooms_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting_room
    @meeting_room = MeetingRoom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_room_params
    params.require(:meeting_room).permit(:name, :schedule, :capacity)
  end
end
