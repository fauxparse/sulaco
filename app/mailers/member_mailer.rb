class MemberMailer < ApplicationMailer
  def invitation(invitation)
    @invitation = invitation

    subject = "#{@invitation.sender} has invited you to join #{invitation.team}"
    mail(to: @invitation.email, subject: subject)
  end
end
