module ApplicationHelper
  def markdown(source)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(source).html_safe
  end

  def expiration_time
    if Post.any?
      Post.order(created_at: :desc).first.created_at + 7.days
    else
      Time.current
    end
  end
end
