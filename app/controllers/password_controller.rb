class PasswordController < ApplicationController
  def new
  end

  def reset
  end

  def mail_reset
    email_to_reset = params[:email]
    url = reset_password_url
    PasswordMailer.reset_password(email_to_reset, url).deliver_now
    flash[:success] = "Password reset email has sent to your email. Please check your inbox and spam"
    redirect_to login_path
  end

  def reset_password
    @user = User.find_by_email(params[:email])

    if @user
      password = params[:password]
      confirm_password = params[:confirm_password]
      if @user.update_attribute(:password, password)
        flash[:success] = "The password has been updated"
        redirect_to login_path
      else
        render 'reset'
      end
    end
  end
end
