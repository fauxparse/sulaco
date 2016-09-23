class MembersController < ApplicationController
  INVITATION_SLOTS = 5

  def index
  end

  def new
    @members = empty_member_list
  end

  def create
    InviteMembers
      .new(team, current_member, params)
      .on(:invited) { |happy, sad| invitations_created(happy, sad) }
      .call
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end

  def success_notice(happy)
    "Added #{happy.count} #{'member'.pluralize(happy.count)}." if happy.any?
  end

  def invitations_created(happy, sad)
    if happy.any? && sad.empty?
      redirect_to team_members_path(team), notice: success_notice(happy)
    else
      @members = sad + empty_member_list(INVITATION_SLOTS - sad.size)
      flash.now[:notice] = success_notice(happy)
      render :new
    end
  end

  def empty_member_list(n = INVITATION_SLOTS)
    (1..n).map { team.members.build }
  end
end
