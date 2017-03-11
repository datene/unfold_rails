class FeaturedUsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit, :update, :create, :destroy]
  before_action :set_featured_user, only: [:update, :destroy]

  def index
    @featured_users = FeaturedUser.all
    @featured_user_path = about_edit_path
  end

  def create
    @featured_user = FeaturedUser.new(featured_user_params)
    if @featured_user.save
      redirect_to about_path
    else
      render 'edit'
    end
  end

  def edit
    @featured_users = FeaturedUser.all
    @featured_user = FeaturedUser.new
  end

  def update
    if @featured_user.update(featured_user_params)
      redirect_to about_path
    else
      render 'edit'
    end
  end

  def destroy
    @featured_user.destroy
    redirect_to about_edit_path
  end

  private

  def set_featured_user
    @featured_user = FeaturedUser.find(params[:featured_user][:id])
  end

  def featured_user_params
    params.require(:featured_user).permit(:name, :description, :photo, :photo_cache)
  end
end