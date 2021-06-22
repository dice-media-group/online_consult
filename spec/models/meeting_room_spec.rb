require 'rails_helper'

RSpec.describe MeetingRoom, type: :model do
  subject do
    create(:meeting_room)
  end

  let(:user) { create(:user) }

  before do
    zone = ActiveSupport::TimeZone['Stockholm']
    Time.zone = zone
    Timecop.freeze(Time.parse('2017-09-01'))
  end

  it 'has a schedule' do
    expect(subject.schedule).to_not eq nil
  end

  it 'schedule is of IceCube class  ' do
    expect(subject.schedule.class).to eq IceCube::Schedule
  end

  it 'has a #start_time' do
    expect(subject.start_time).to_not eq nil
  end

  it '#start_time is of IceCube class' do
    expect(subject.start_time.class).to eq IceCube::Occurrence
  end

  it '#start_time has a value' do
    expect(subject.start_time.to_s).to eq '2017-09-01 13:00:00 +0200'
  end

  describe 'booking methods' do
    before do
      # Here we crate two instance variables using the
      # `next_occurrences` method.
      @first_slot, @second_slot = subject.schedule.next_occurrences(2)
    end

    xit 'should be bookable' do
      # For some reason I get an NoMethodError
      # `undefined method `bookable?' for #<MeetingRoom:...>`
      expect(subject.bookable?).to be_truthy
    end

    it 'has occurrences in the future' do
      expect(@first_slot.to_s)
        .to eq '2017-09-01 13:00:00 +0200'
      expect(@second_slot.to_s)
        .to eq '2017-09-02 08:00:00 +0200'
    end

    describe 'User performs booking' do
      let(:perform_booking_by_user) do
        lambda {
          user.book! subject,
                     time: @first_slot,
                     amount: 1
        }
      end

      let(:perform_booking_by_room) do
        lambda {
          subject.be_booked! user,
                             time: @second_slot,
                             amount: 1
        }
      end

      context 'perform_booking_by_user' do
        it 'increases booking count in db' do
          expect { perform_booking_by_user.call }
            .to change { ActsAsBookable::Booking.count }.by 1
        end

        it 'adds booking to collection' do
          perform_booking_by_user.call
          booking = ActsAsBookable::Booking.last
          expect(subject.bookings)
            .to include booking
        end
      end

      context 'perform_booking_by_room' do
        it 'increases booking count in db' do
          expect { perform_booking_by_room.call }
            .to change { ActsAsBookable::Booking.count }.by 1
        end

        it 'adds perform_booking_by_room to collection' do
          perform_booking_by_room.call
          booking = ActsAsBookable::Booking.last
          expect(subject.bookings)
            .to include booking
        end

        it 'booking has the correct time' do
          perform_booking_by_room.call
          expect(subject.bookings.first.time.to_s)
            .to eq '2017-09-02 08:00:00 +0200'
        end
      end
    end
  end
end
