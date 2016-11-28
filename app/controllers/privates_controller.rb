class PrivatesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def stock_or_new
  end

  def estoque
    @vehicles = Vehicle.all
    @total_vehicles = @vehicles.size
    @total_patrimonio = 0;
    @vehicles.each do |vehicle|
      @total_patrimonio += vehicle.value
    end

    respond_to do |format|
      format.html
      format.pdf {
        render pdf: "estoque.pdf",
               footer: { center: "[page] de [topage]" }
      }
    end
  end
end
