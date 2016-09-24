# frozen_string_literal: true

module ApplicationHelper
  GRACE_PERIOD = 1.week.freeze

  def markdown(source)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(source).html_safe
  end

  def expiration_time
    if Post.any?
      Post.order(created_at: :desc).first.created_at + GRACE_PERIOD
    else
      Time.current
    end
  end
end
