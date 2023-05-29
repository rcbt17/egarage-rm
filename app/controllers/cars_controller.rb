class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity

    end
  end
  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :transmission, :seats, :air_conditioning, :price_per_day, :class)
  end

end
