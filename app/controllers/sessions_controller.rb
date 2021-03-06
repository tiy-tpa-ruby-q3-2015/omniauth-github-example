class SessionsController < ApplicationController
  def create
    self.current_user = User.from_omniauth(request.env['omniauth.auth'])

    if current_user
      redirect_to root_path
    else
      redirect_to signin_path
    end
  end

  def new
    # render new.html.erb
  end

  def destroy
    clear_current_user!
    redirect_to root_path
  end

  def failure
    # render failure.html.erb
  end
end

