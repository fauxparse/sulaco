class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def accept
    invitation.member.update!(user: current_user)
    redirect_to invitation.team, notice: "Welcome to #{invitation.team}!"
  end

  private

  def invitation
    @invitation || Invitation.find_by!(token: params[:id])
  end

  def save_clicked_invitation
    session[:invitation] = invitation.id
  end

  def authenticate_user!
    store_location_for(:user, request.url)
    save_clicked_invitation
    super
  end
end
