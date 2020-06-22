class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to(root_path)
    else
      redirect_to(root_path)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :name, :email)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end
