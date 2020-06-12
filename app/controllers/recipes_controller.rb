class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: '投稿に成功しました。'
    else
      render :new  #保存できなかった場合はアクションを経由しないでnewにいくよ
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user_id != current_user.id
      redirect_to recipe_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: '更新に成功しました。'
    else
      render :edit #editアクションを介することなく遷移する
    end
  end

  def destroy
    recipe = Recipe.find(params[:id]) #destroyはローカル変数(viewに渡すことはないので@つけんよ〜)
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body)
  end
end
