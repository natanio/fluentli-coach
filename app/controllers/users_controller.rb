class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    @coach = Coach.new
    authorize User
  end

  def show
    @user = User.find(params[:id])
    unless @user.user? || @user.admin? then @testimonials = @user.coach.testimonials end
    @spoken_languages = LanguageRelationship.where(user_id: @user.id).where(relationship: 'fluent')
    @learning_languages = @user.language_relationships.where(relationship: 'learning')
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def new_subscription
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
