class ScheduledCallsController < ApplicationController
  before_action :set_scheduled_call, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @scheduled_calls = ScheduledCall.all
    respond_with(@scheduled_calls)
  end

  def show
    respond_with(@scheduled_call)
  end

  def new
    set_coach
    @scheduled_call = ScheduledCall.new
    respond_with(@scheduled_call)
  end

  def edit
  end

  def create
    set_coach
    @suggested_time_1 = DateTime.parse(params[:suggested_time_1])
    @suggested_time_2 = DateTime.parse(params[:suggested_time_2])
    @suggested_time_3 = DateTime.parse(params[:suggested_time_3])

    @scheduled_call = @coach.scheduled_calls.new(scheduled_call_params)
    @scheduled_call.price = @coach.call_rate
    @scheduled_call.learner_id = current_user.id

    @scheduled_call.suggested_times.new(time: @suggested_time_1, agreed: false)
    @scheduled_call.suggested_times.new(time: @suggested_time_2, agreed: false)
    @scheduled_call.suggested_times.new(time: @suggested_time_3, agreed: false)

    flash[:notice] = 'Scheduled call was successfully created.' if @scheduled_call.save
    respond_with(@scheduled_call)
  end

  def update
    flash[:notice] = 'Scheduled call was successfully updated.' if @scheduled_call.update(scheduled_call_params)
    respond_with(@scheduled_call)
  end

  def destroy
    @scheduled_call.destroy
    respond_with(@scheduled_call)
  end

  private
    def set_scheduled_call
      @scheduled_call = ScheduledCall.find(params[:id])
    end

    def set_coach
      @user = User.find(params[:user_id])
      @coach = User.find(params[:user_id]).coach
    end

    def scheduled_call_params
      params.require(:scheduled_call).permit(:call_details, :price, :coach_id, :learner_id)
    end
end
