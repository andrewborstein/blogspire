class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :new, :update]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.order(created_at: :desc)

    if params[:like]
      @blogs = @blogs.liked_by_user(current_user.id)
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blogger_logged_in = current_user == @blog.user
    @comment = Comment.new(blog_id: @blog.id)
    @blog_comments = @blog.comments.order(created_at: :asc)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html{ redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json{ render :show, status: :created, location: @blog }
      else
        format.html{ render :new }
        format.json{ render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html{ redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json{ render :show, status: :ok, location: @blog }
      else
        format.html{ render :edit }
        format.json{ render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html{ redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json{ head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :image, :user_id)
    end
end
