class PostsController < ApplicationController

def authentificate
  before_action :authenticate_user!
end


  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end


  def post_params
    params.require(:post).permit(:author, :content, :title, :image)
  end

end
