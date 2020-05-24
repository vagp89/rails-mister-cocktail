class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to @cocktail, notice: 'Garden was successfully destroyed.'
  end
  # end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
