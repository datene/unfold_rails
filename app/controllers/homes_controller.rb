class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_home
  def show
    @home_path = home_edit_path
  end

  def edit
  end

  def update
    if @home.update(homes_params)
      redirect_to home_path
    else
      render 'edit'
    end
  end

  private

  def homes_params
    params.require(:home).permit(:header, :content)
  end

  def set_home
    @home = Home.first
  end
end