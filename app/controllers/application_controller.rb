class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || super
  end

  def after_sign_up_path_for(resource)
    stored_location_for(resource) || super
  end

  def team
    @team ||= Team.includes(members: :user).find_by(slug: team_id)
  end

  helper_method :team

  def team_id
    params[:team_id]
  end

  def current_member
    @current_member ||= team.members.find_by(user: current_user)
  end
end
