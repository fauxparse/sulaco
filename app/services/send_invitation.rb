class SendInvitation
  attr_reader :member, :sender

  def initialize(member, sender)
    @member = member
    @sender = sender
  end

  def call
    MemberMailer.invitation(invitation).deliver_later
  end

  private

  def invitation
    @invitation ||= member.invitations.create!(sender: sender, email: email)
  end

  delegate :email, to: :member
end
