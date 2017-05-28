class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if (@user = login(params[:email], params[:password]))
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      redirect_to login_path, alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
