class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
