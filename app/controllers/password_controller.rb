class PasswordController < ApplicationController
  def new
  end

  def reset
    @user = User.find_by_email("jeonso3412@gmail.com")
  end

  def mail_reset
    email_to_reset = [:email]
    url = reset_password_url
    PasswordMailer.reset_password(email_to_reset, url).deliver_now
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    current_password = params[:user][:current_password]

    if @user
      new_password = params[:new_password]
      confirm_password = params[:confirm_password]
      if @user.update(password: new_password, confirm_password: confirm_password)
        flash[:success] = "The password has been updated"
        # redirect_to login_url
      # else
      #   render 'reset'
      end
    end
  end
end
