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

    def my_courses
        Course.all.reject{|c| c.users.exclude? current_user}
    end

    def grade_course_id
        if session[:grade_course_id]
            session[:user_id]
        end
    end

end
