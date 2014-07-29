class CategoriesController < ApplicationController

  before_action :require_user, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      flash[:notice] = "New Category Created"
      redirect_to categories_path
    else
      render :new
    end


  end

  def show
    @category = Category.find_by slug: params[:id]
  end


  def edit
    @category = Category.find_by slug: params[:id]
  end

  def update
    @category = Category.find_by slug: params[:id]

    if @category.update(cat_params)
      flash[:notice] = "Successful Category Update"
      redirect_to categories_path
    else
      render :edit
    end

  end

  def destroy
  end

  private

  def cat_params
    params.require(:category).permit(:name)
  end



end

