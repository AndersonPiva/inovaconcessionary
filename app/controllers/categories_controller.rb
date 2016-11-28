class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.all
    @total_categories = @categories.size
    flash[:notice] = nil
    if params[:query].present?
     @categories = Category.where('name iLIKE ?', "%#{params[:query]}%")
     @total_categories = @categories.size
   else
     flash[:notice] = ''
   end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      aux = 0

      Category.all.each do |category|
        if category.name == @category.name
          aux = 1
        end
      end

      if aux == 0
        @category.save
        format.html { redirect_to categories_url}
        flash[:info] = ''
      else
        format.html { redirect_to :back}
        flash[:error] = ''
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url}
        flash[:update] = ''
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url}
      flash[:warning] = ''
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
