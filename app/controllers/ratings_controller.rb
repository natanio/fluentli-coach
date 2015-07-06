class RatingsController < ApplicationController
  before_action :authenticate_user!

  def update
    @rating = Rating.find(params[:id])
    @coach = @rating.coach
    if @rating.update_attributes(rating: params[:rating])
      respond_to do |format|
        format.js
      end
    end
  end

private

  def rating_params
    params.require(:rating).permit(:learner_id, :coach_id, :rating)
  end
end