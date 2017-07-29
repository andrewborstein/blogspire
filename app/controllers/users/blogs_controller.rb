class Users::BlogsController < ApplicationController
  def index
    @blogs = Blog.where(user_id: params[:user_id]).order(created_at: :desc)
    render 'blogs/index'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body, :image, :user_id)
  end
end
