class SessionsController < ApplicationController
  def create
    logger.info('here')
  	user = User.from_omniauth(env["omniauth.auth"], request.env["omniauth.params"]["runner"])
  	session[:user_id] = user.id
    redirect_to request.env['omniauth.origin'] || '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end

end