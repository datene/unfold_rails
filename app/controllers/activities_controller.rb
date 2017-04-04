class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_activity
  def show
    @activity_path = what_edit_path
  end

  def edit
  end

  def update
    if @activity.update(activities_params)
      redirect_to what_path
    else
      render 'edit'
    end
  end

  private

  def activities_params
    params.require(:activity).permit(:header, :description, :photo, :photo_cache)
  end

  def set_activity
    @activity = Activity.first
  end
end