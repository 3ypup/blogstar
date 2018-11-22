class PostsController < ApplicationController


  before_action :authenticate_user!



  def index

    @posts_all = Post.all
    
    #create mass for posts
    @posts = []

    # check if there is posts
    if @posts_all.count >0 

          @posts_all.each do |post|
              #check if is it time to publick post
        if post.postdate.to_datetime < DateTime.now.to_datetime
              #add this posts to mass
          @posts << post
              #or if user is post author  add this posts to mass
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

    #return to form if validation fail
    if  @post.save
        redirect_to @post
      else
        render action: 'new'
      end
  end



 def edit

      @post = Post.find(params[:id]) 

  end


def update

  @post = Post.find(params[:id])

  #check to allowed edition only to authors
  if current_user.email == @post.author
  #return to form if validation fail
     if  @post.update(post_params) 
        redirect_to @post

      else
        render action: 'edit'
      end

    else
      redirect_to @post
    end
end


  def destroy
  end


  def post_params
    params.require(:post).permit(:author, :content, :title, :mainpic, :postdate)
  end

end
