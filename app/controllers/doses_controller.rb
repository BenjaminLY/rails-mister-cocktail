class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @ingredients = Ingredient.all
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:dose_id])
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:doses).permit(:description, :ingredient)
  end
end
