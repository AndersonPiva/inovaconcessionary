class SearchsController < ApplicationController
  def search
    flash[:notice] = nil
    if params[:query].present?
      @vehicles = Vehicle.where('title iLIKE ?', "%#{params[:query]}%").paginate(page: params[:page], per_page: 4)
      @total_vehicles = @vehicles.size
    else
      flash[:notice] = ''
    end
  end
end
