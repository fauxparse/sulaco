class InviteMembers
  include Cry

  attr_reader :team, :sender, :member_attributes

  def initialize(team, sender, member_attributes)
    @team = team
    @sender = sender
    @member_attributes = member_attributes
  end

  def call
    happy, sad = members.partition(&:save)
    happy.each do |member|
      SendInvitation.new(member, sender).call if member.email?
    end
    publish(:invited, happy, sad)
  end

  private

  def members
    @members ||= member_attributes.map do |attributes|
      unless attributes.blank? || attributes.values.all?(&:blank?)
        team.members.build(name: attributes[:name], email: attributes[:email])
      end
    end.compact
  end
end
