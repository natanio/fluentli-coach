class TestimonialsController < ApplicationController
  before_action :authenticate_user!
  # => after_action :verify_authorized

  def index
    @user = User.find(params[:user_id])
    @testimonials = @user.testimonials
    authorize current_user
  end

  def new
    set_user
    @rating = Rating.where(learner_id: current_user.id, coach_id: @user.coach.id).first
    unless @rating
      @rating = Rating.create(learner_id: current_user.id , coach_id: @user.coach.id , rating: 0)
    end
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = current_user.learner.testimonials.new(testimonial_params)
    @testimonial.update_attribute(:coach_id, User.find(params[:user_id]).coach.id )
    @testimonial.save
    render plain: params[:user_testimonials].inspect
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end

  def testimonial_params
    params.require(:testimonial).permit(:learner_id, :coach_id, :content)
  end

end
