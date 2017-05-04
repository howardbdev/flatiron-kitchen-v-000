class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times {@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def edit
  end

  def show
    @ingredients = @recipe.ingredients
  end

  def destory
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients)
  end

end
