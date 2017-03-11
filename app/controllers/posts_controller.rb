class PostsController < ApplicationController
  before_action :authorize_user

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to "/home"
    end

  end

  private
   def post_params
    params.require(:post).permit(:post_text, :img)
   end
end
