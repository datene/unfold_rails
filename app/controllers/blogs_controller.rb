class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_blog
  def show
    @post_collection = Blogposts::BlogpostService.new(@blog.user).call
    @blog_path = blog_edit_path(@blog)
  end

  def edit
  end

  def update
    if @blog.update(blogs_params)
      redirect_to blog_path
    else
      render 'edit'
    end
  end

  private

  def blogs_params
    params.require(:blog).permit(:user)
  end

  def set_blog
    @blog = Blog.first
  end
end