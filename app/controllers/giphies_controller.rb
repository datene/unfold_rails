class GiphiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @giphy_path = gifmemore_edit_path
    @giphy = Giphy.new
    set_default
    @giphies = Giphy.all
  end

  def create
    @giphy = Giphy.new(giphy_params)
    if @giphy.save
      redirect_to gifmemore_path
    else
      render 'show'
    end
  end

  def edit
    @giphies = Giphy.all
  end

  def update
    @giphy = Giphy.find(params[:giphy][:id].to_i)
    remove_old_default
    @giphy.default = true
    if @giphy.save
      redirect_to gifmemore_edit_path
    end
  end

  def destroy
    @giphy = Giphy.find(params[:giphy][:id].to_i)
    @giphy.destroy
    redirect_to gifmemore_edit_path
  end

  private

  def set_default
    @giphy_default = Giphy.find_by_default(true) || "http://media4.giphy.com/media/3o6gaW2l0FJB0jt7MY/giphy.gif"
  end

  def remove_old_default
    old_default = Giphy.find_by_default(true)
    unless old_default.nil?
      old_default.default = false
      old_default.save
    end
  end

  def giphy_params
    params.require(:giphy).permit(:url, :creator, :default, :message)
  end
end