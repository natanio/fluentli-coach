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
    @scheduled_call = ScheduledCall.new
    respond_with(@scheduled_call)
  end

  def edit
  end

  def create
    @scheduled_call = ScheduledCall.new(scheduled_call_params)
    flash[:notice] = 'ScheduledCall was successfully created.' if @scheduled_call.save
    respond_with(@scheduled_call)
  end

  def update
    flash[:notice] = 'ScheduledCall was successfully updated.' if @scheduled_call.update(scheduled_call_params)
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

    def scheduled_call_params
      params.require(:scheduled_call).permit(:suggested_time_1, :suggested_time_2, :suggested_time_3, :agreed_time, :price)
    end
end
