class User < ApplicationRecord
  has_secure_password

  def new
  end

  def create
    user = User.new(user_params)
    puts "Crete user"
    puts user
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
