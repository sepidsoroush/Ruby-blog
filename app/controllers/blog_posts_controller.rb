class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_blog_post, only: %i[show edit update destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to blog_posts_path, notice: "Blog post created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to blog_posts_path, notice: "Blog post updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path, notice: "Blog post deleted"
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title , :content)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def authenticate_user!
    redirect_to new_user_session_path, alert: "You must be signied in." unless user_signed_in?
  end
end
