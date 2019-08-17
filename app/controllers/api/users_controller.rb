class Api::UsersController < Api::BaseController

  def update
    user = User.find_by(email: params[:user][:email])
    if user.update(user_params)
      render json: { user: user}, status: :ok
    else
      Rails.logger.info user.errors.messages.values.join(', ')
      render json: { message: user.errors.messages.values.join(', ') }, status: :unprocessable_entity
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password) #, :password_confirmation)
  end
end
