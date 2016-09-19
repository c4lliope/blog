module ApplicationHelper
  def expiration_time
    Post.order(created_at: :desc).first.created_at + 7.days
  end
end
