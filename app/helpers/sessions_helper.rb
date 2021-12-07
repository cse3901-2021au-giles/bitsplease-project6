module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    # Returns the current logged-in user (if any).
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end
    
     # Logs out the current user by deleting the current user id from the session
     # Logs out action also set the @current_user to nil
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def staff_user
      logged_in? and ["Instructor","Teaching Assistant"].include? current_user.user_role
  end

  def super_user
    true if current_user.user_role.eql? "Super User"
  end

  def student_user
    true if current_user.user_role.eql? "Student"
  end

  def staff_or_student
    true if staff_user or student_user
  end

  def correct_admin_user
    unless logged_in? and ['Instructor','Teaching Assistant'].include? current_user.user_role
      flash[:danger]="Your request is denied."
      redirect_to(root_url) 
    end
  end  

  def correct_team_grade_user
    unless logged_in? and ['Instructor','Teaching Assistant','Student'].include? current_user.user_role
      flash[:danger]="Your request is denied."
      redirect_to(root_url) 
    end
  end   

end
