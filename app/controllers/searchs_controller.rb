class SearchsController < ApplicationController
  def search
    flash[:notice] = nil
    if params[:query].present?
      @vehicles = Vehicle.where('title iLIKE ?', "%#{params[:query]}%")
      @total_vehicles = @vehicles.size
    else
      flash[:notice] = ''
    end
  end
end
