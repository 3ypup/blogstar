class CommentsController < ApplicationController

def new

end

def create

end



def comment_params
    params.require(:comment).permit(:author, :text)
end

end
