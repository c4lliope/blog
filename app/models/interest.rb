# frozen_string_literal: true

class Interest < ApplicationRecord
  validates :email, presence: true
end
