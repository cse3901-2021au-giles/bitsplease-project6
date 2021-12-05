class PasswordMailer < ApplicationMailer
    default from: 'bitplease-rating@osu.edu'

    def reset_password(email_to_reset, url)
        email = "jeonso3412@gmail.com"
        @url = url
        mail(to: email, subject: 'Reset Password')
    end

    def reset

    end
end
