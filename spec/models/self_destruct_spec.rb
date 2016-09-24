# frozen_string_literal: true

require "rails_helper"

describe SelfDestruct do
  describe "#attempt" do
    it "deletes all posts if it is after the expiration" do
      grace_period = ApplicationHelper::GRACE_PERIOD
      create(:post, created_at: (grace_period + 1.minute).ago)

      expect { SelfDestruct.new.attempt }.to change(Post, :count).from(1).to(0)
    end

    it "does not delete anything if it is before the expiration" do
      grace_period = ApplicationHelper::GRACE_PERIOD
      create(:post, created_at: (grace_period + 1.minute).ago)
      create(:post, created_at: (grace_period - 1.minute).ago)

      expect { SelfDestruct.new.attempt }.not_to change(Post, :count).from(2)
    end
  end
end
