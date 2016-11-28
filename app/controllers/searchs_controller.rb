class SearchsController < ApplicationController
  def search
    flash[:notice] = nil
    if params[:query].present?
      @vehicles = Vehicle.search(params[:query], page: params[:page], per_page: 4)
      @total_vehicles = @vehicles.size
    else
      flash[:notice] = ''
    end
  end
end
