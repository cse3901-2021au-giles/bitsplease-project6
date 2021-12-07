class PasswordMailer < ApplicationMailer
    default from: 'bitplease-rating@osu.edu'

    def reset_password(email_to_reset, url)
        @email = email_to_reset
        @url = url + "?email=" + @email
        mail(to: @email, subject: 'Reset Password')
    end

    def reset

    end
end
