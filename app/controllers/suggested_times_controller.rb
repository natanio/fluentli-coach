class SuggestedTimesController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def edit
    @suggested_time = SuggestedTime.find(params[:id])
  end

  def update
    flash[:notice] = 'The suggested time was successfully updated.' if @suggested_time.update(suggested_time_params)
    respond_with(@scheduled_call)
  end

  def destroy
  end

  def accept
    @suggested_time = SuggestedTime.find(params[:time_id])
    @suggested_time.update_attribute(:agreed, true)

    if @suggested_time.save
      redirect_to root_path
      flash[:notice] = 'Your call has been scheduled for: ' + @suggested_time.time.strftime("%H:%M %B %d, %Y")
    end
  end

private
  def suggested_time_params
    params.require(:suggested_time).permit(:time, :scheduled_call_id)
  end
end