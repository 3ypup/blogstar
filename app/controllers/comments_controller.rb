class CommentsController < ApplicationController

def new

end

def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)

    redirect_to post_path(@post)

end



def comment_params
    params.require(:comment).permit(:author, :text)
end

end
