class MembersController < ApplicationController
  def index
  end

  def new
    @member = team.members.build
  end

  def create
    @member = team.members.build(member_params)

    if @member.save
      redirect_to team_members_path(team), notice: "Added #{@member.name}."
    else
      render :new
    end
  end

  private

  def team
    @team ||= Team.includes(:members).find_by(slug: params[:team_id])
  end

  helper_method :team

  def member_params
    params.require(:member).permit(:name)
  end
end
