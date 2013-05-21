class CabsController < ApplicationController

  def show
    @cab = Cab.find(params[:id])
  end
end
