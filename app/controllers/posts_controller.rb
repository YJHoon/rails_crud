class PostsController < ApplicationController
  before_action :load_post, only:[:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token    
  def index
    @posts = Post.all
  end
  
  def show
  end

  def new
    @post = Post.new
  end

  def create
    Post.create!(post_params)
    redirect_to root_path
  end
  
  def edit
  end
  
  def update
    @post.update!(post_params)
    redirect_to root_path
  end
  
  def destroy
    @post.destroy
    redirect_to root_path
  end
  
  def comment_create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to root_path
  end
  
  def comment_destroy
    @comment.destroy
    redirect_to post_path
  end

  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def load_post
    @post = Post.find params[:id]
  end
  
  def load_comment
    @comment = Comment.find params[:id]
  end
end
