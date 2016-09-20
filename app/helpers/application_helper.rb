module ApplicationHelper
  def expiration_time
    if Post.any?
      Post.order(created_at: :desc).first.created_at + 7.days
    else
      Time.current
    end
  end
end
