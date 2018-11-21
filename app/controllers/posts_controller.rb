class PostsController < ApplicationController


  before_action :authenticate_user!



  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)

    if  @post.save
        redirect_to @post
      else
        render action: 'new'
      end
  end

  def destroy
  end


  def post_params
    params.require(:post).permit(:author, :content, :title, :mainpic)
  end

end
