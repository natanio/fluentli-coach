class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    #@user_profile = User.find(params[:id])

    if @user.coach?
      current_user
    else
      @current_user.admin? or @current_user == @user or current_user.coach?
    end
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

end
