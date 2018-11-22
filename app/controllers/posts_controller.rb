class PostsController < ApplicationController


  before_action :authenticate_user!



  def index

    @posts_all = Post.all
    @posts = []

    if @posts_all.count >0 

          @posts_all.each do |post|

        if post.postdate.to_datetime < DateTime.now.to_datetime

          @posts << post

        elsif current_user.email == post.author

         @posts << post
         

        end

      end  
    end 
    
  end

  def show
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:author, :content, :title, :mainpic, :postdate)
  end

end
