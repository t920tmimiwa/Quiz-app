class TopController < ApplicationController
  def main
    if session[:uname]
      render 'main'
    else
      render 'login'
    end
  end
  
  def login
    user = User.find_by(uname: params[:uname])
    if user
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:pass]
        session[:uname] = user.uname
        session[:uid] = user.id
        redirect_to root_path
      else
        render 'login'
      end
    else
      render 'login'
    end
  end

  def logout
    session.delete(:uname)
    redirect_to root_path
  end
end
