class SendMailer < ApplicationMailer
  def send_email(to_email, account)

    # byebug
    @account = account
    mail(to: to_email, subject: "account login otp", body: "@account") do |format|
      # format.text { render plain: message }
      format.html { render 'send_mailer/send_email'}
      # format.html { render 'send_mailer/send_page'}
    end
  end
end