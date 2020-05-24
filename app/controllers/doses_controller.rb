class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]
  def new
    @cocktal = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose= Dose.new(dose_params)
    @dose = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail, notice: 'The dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose, notice: 'Dose was successfully destroyed.'
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end


