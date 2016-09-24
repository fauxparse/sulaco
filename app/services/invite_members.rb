class InviteMembers
  include Cry

  attr_reader :team, :sender, :params

  def initialize(team, sender, params)
    @team = team
    @sender = sender
    @params = params
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
    @members ||= params[:members].values.map do |attributes|
      unless attributes[:name].blank?
        team.members.build(name: attributes[:name], email: attributes[:email])
      end
    end.compact
  end
end
