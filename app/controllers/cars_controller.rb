class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @cars = Car.where.not(user: current_user)
  end

  def new
    @car = Car.new
  end

  def manage
    @cars = Car.where(user: current_user)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to manage_cars_path, status: :see_other
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    # raise
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
    if @car.user != current_user
      redirect_to manage_cars_path
    end
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params) # Will raise ActiveModel::ForbiddenAttributesError
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :transmission, :seats, :air_conditioning, :price_per_day, :class_type, :photo)
  end

end
