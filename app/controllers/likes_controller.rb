class LikesController < ApplicationController
  before_action :find_post, only: %i[create]

  def create
    @like = current_user.likes.find_or_initialize_by(post_id: @post.id)

    respond_to do |format|
      format.js{
        if @like.new_record?
          @like.save
          @success = true
        else
          @like.destroy
          @success = false
        end
                 
        render "posts/like.js.erb"
      }
    end
  end

  private 
  def find_post
    @post = Post.find(params[:post_id])
  end
end
