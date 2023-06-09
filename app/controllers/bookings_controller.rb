class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end


  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def create
    begin
      @car = Car.find(params[:car_id])
      start_date = booking_params[:start_date].split(" to ")[0]
      end_date = booking_params[:start_date].split(" to ")[1]
      total_days = (Date.parse(end_date) - Date.parse(start_date)).to_i
      total_price = @car.price_per_day.to_i * total_days
    rescue
      return
    end
    if overlap?(start_date, end_date, @car)
      flash.alert = "Sorry, the selected dates are not available!"
      redirect_to car_path(@car)
      return false
    end
    @booking = Booking.new(
                          start_date: start_date,
                          end_date: end_date,
                          location: "None",
                          total_price: total_price,
                          total_days: total_days,
                          car: @car,
                          user: current_user
                          )
    if @booking.save
      redirect_to booking_path(@booking)
    end
  end

  def overlap?(start_date, end_date, car)
    all_ranges = Booking.where(car: car)
    all_ranges.each do |booking|
      if (start_date <= booking.end_date && end_date >= booking.start_date)
        return true
      end
    end
    return false
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date)
  end
end
