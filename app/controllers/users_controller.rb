class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def new
   @user=User.new
  end
  def index
    @users = User.paginate(page: params[:page])
  end
  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.password="password"
    @user.password_confirmation="password"
    if @user.save
      flash[:success]="User created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="Your profile has been updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation,)

  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    
    unless @user == current_user
      flash[:danger]="You request is denied."
      redirect_to(root_url) 
    end
  end
  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end