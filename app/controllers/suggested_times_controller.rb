class SuggestedTimesController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def update
  end

  def destroy
  end

private
  def suggested_time_params
    params.require(:suggested_time).permit(:time, :scheduled_call_id)
  end
end