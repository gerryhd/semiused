class CarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new(release_date: DateTime.current)
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      flash[:success] = "Car created successfully"
      
      redirect_to cars_path
    else
      flash.now[:error] = "Error creating cart"

      render :new
    end
  end

  def destroy
    @car.destroy

    flash[:success] = "Car deleted successfully"

    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :release_date, :original_price, :photo)
  end
end
