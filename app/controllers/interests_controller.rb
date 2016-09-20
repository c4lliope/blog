# frozen_string_literal: true

class InterestsController < ApplicationController
  def create
    @interest = Interest.new(interest_params)

    if @interest.save
      redirect_back(
        fallback_location: root_path,
        notice: t("interest.create.success"),
      )
    else
      redirect_back(
        fallback_location: root_path,
        alert: t("interest.create.failure"),
      )
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:email)
  end
end
