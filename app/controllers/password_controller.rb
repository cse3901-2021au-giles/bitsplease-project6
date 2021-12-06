class PasswordController < ApplicationController
  def new
  end

  def reset
    @user = User.find_by_email(request.params[:email])
  end

  def mail_reset
    email_to_reset = params[:email]
    url = reset_password_url
    PasswordMailer.reset_password(email_to_reset, url).deliver_now
    redirect_to login_url
  end

  def reset_password
    current_password = params[:user][:current_password]

    if @user
      new_password = params[:new_password]
      confirm_password = params[:confirm_password]
      if @user.update_attribute(password: new_password)
        flash[:success] = "The password has been updated"
        redirect_to login_url
      else
        render 'reset'
      end
    end
  end
end
