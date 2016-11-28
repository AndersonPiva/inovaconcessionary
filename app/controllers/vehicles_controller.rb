class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:edit, :update, :destroy]

  def index
    @vehicles = Vehicle.paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
    @total_vehicles = Vehicle.all.size
    @vehicles_promotion = Vehicle.where(promotion: "Sim")
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    if current_user.present?
      @vehicle = Vehicle.new
      @models = Model.all
      @categories = Category.all
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if !current_user.present?
      redirect_to new_user_session_path
    else
      @models = Model.all
      @categories = Category.all
    end
  end

  def addDestaque
    if current_user.present?
      vehicle = Vehicle.find(params[:id])
      vehicle.promotion = "Sim"
      vehicle.save
      redirect_to vehicles_url
      flash[:add] = ''
    else
      redirect_to new_user_session_path
    end
  end

  def removeDestaque
    if current_user.present?
      vehicle = Vehicle.find(params[:id])
      vehicle.promotion = "Não"
      vehicle.save
      redirect_to vehicles_url
      flash[:warning] = ''
    else
      redirect_to new_user_session_path
    end
  end

  def autocomplete
      render json: Vehicle.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  def create
    if current_user.present?
      @vehicle = Vehicle.new(vehicle_params)

      respond_to do |format|
        if @vehicle.save
          format.html { redirect_to vehicles_path }
          flash[:error] = ''
        else
          format.html { render :new }
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if current_user.present?
      respond_to do |format|
        if @vehicle.update(vehicle_params)
          format.html { redirect_to vehicles_path }
          flash[:update] = ''
        else
          format.html { render :edit }
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if current_user.present?
      @vehicle.destroy
      respond_to do |format|
        format.html { redirect_to vehicles_url}
        flash[:info] = ''
      end
    else
      redirect_to new_user_session_path
    end
  end

  def offers
    @vehicles = Vehicle.where(promotion: "Sim").order("created_at DESC")
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:title, :value, :description, :year, :promotion, :transmission, :fuel, :color, :km, :model_id, :category_id, optionals_attributes: [:id, :description, :_destroy], images_attributes: [:id, :cover, :_destroy])
    end
end
