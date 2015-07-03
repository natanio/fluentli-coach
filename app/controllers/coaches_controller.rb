class CoachesController < UsersController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
  end

  def show
  end

  def new
  end

  def update
    @coach = Coach.find(params[:id])
    authorize @coach
    if @coach.update_attributes(secure_params)
      redirect_to :back, :notice => "Your Coach settings have been updated."
    else
      redirect_to :back, :alert => "Unable to update your coach settings."
    end
  end

  def destroy
  end

private

  def secure_params
    params.require(:coach).permit(:will_chat, :will_call, :is_available, :services, :user_id, :video_url, :call_rate)
  end
end