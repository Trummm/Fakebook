module PostsHelper
  def post_like_by_user? post_id
    current_user.likes.find_by(post_id: post_id).present?
  end
end
