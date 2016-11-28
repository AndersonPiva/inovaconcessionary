class ModelsController < ApplicationController
  before_action :set_model, only: [:update, :destroy]
  before_action :authenticate_user!

  def index
    flash[:notice] = nil
    @models = Model.all
    @total_models = @models.size
    if params[:query].present?
     @models = Model.where('name iLIKE ?', "%#{params[:query]}%")
     @total_models = @models.size
   else
     flash[:notice] = ''
   end
  end

  def create
    @model = Model.new(model_params)

    aux=0

    Model.all.each do |model|
      if model.name == @model.name
        aux=1
      end
    end
      if aux == 0
        @model.save
        redirect_to models_url
        flash[:info] = ''
      else
        redirect_to :back
        flash[:error] = ''
      end
  end

  def update
      if @model.update(model_params)
          redirect_to models_url
          flash[:update] = ''
      else
        format.html { render :edit }
    end
  end

  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url}
      flash[:warning] = ''
    end
  end

  private
    def set_model
      @model = Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:name)
    end
end
