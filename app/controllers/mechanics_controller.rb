class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    if MechanicRide.where(mechanic_id: params[:id], ride_id: params[:ride]) != []
      flash[:notice] = "Mechanic already working on that ride"
      redirect_back fallback_location: '/mechanics'
    else
      MechanicRide.create(mechanic_id: params[:id], ride_id: params[:ride])
      redirect_back fallback_location: '/mechanics'
    end
  end
end
