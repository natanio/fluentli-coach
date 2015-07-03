class LearnersController < UsersController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
  end

  def show
  end

  def new
  end

  def update
    @learner = Learner.find(params[:id])
    authorize @learner
    if @learner.update_attributes(secure_params)
      redirect_to :back, :notice => "Your Learner settings have been updated."
    else
      redirect_to :back, :alert => "Unable to update your learner settings."
    end
  end

  def destroy
  end

private

  def secure_params
    params.require(:learner).permit(:bio, :reason_why)
  end
end