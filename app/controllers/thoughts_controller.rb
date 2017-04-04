class ThoughtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_thought
  def show
    @thought_path = why_edit_path
  end

  def edit
  end

  def update
    if @thought.update(thoughts_params)
      redirect_to why_path
    else
      render 'edit'
    end
  end

  private

  def thoughts_params
    params.require(:thought).permit(:header, :description, :photo, :photo_cache)
  end

  def set_thought
    @thought = Thought.first
  end
end