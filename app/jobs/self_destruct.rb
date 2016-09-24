# frozen_string_literal: true

class SelfDestruct
  include ApplicationHelper

  def attempt
    if Time.current > expiration_time
      Rails.logger.fatal "[Self Destruct] Time expired, deleting all posts!"
      Post.destroy_all
    else
      Rails.logger.info "[Self Destruct] Time has not expired, cancelling self-destruct"
    end
  end
end
