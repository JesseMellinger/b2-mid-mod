class RideMechanicsController < ApplicationController

  def create
    RideMechanic.create(mechanic_id: params[:mechanic_id],
                        ride_id: params[:id])

    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end

end
