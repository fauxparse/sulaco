class TeamsController < ApplicationController
  def show
  end

  private

  def team
    @team ||= Team.find_by(slug: params[:id])
  end

  helper_method :team
end
