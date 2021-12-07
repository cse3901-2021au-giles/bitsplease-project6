class PasswordController < ApplicationController
  def new
  end

  def reset
    @user = User.find_by_email(params[:email])
  end

  def mail_reset
    @user = User.find_by_email(params[:email])
    if @user
      email_to_reset = params[:email]
      url = reset_password_url
      PasswordMailer.reset_password(email_to_reset, url).deliver_now
      flash[:success] = "Password reset email has sent to your email. Please check your inbox and spam"
      redirect_to login_path
    else 
      flash[:danger] = "Not a valid email, please try again!"
      redirect_to mail_reset_password_path
    end
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    if @user
      password = params[:password]
      password_confirmation = params[:password_confirmation]
      if password != password_confirmation
        flash[:danger] = "Password and confirm password do not match"
        redirect_to request.fullpath + "?email=" + params[:email]
      elsif @user.update_attribute(:password, password)
        flash[:success] = "The password has been updated"
        redirect_to login_path
      end
    end
  end
end
