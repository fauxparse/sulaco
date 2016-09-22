class TeamsController < ApplicationController
  def index
  end

  def show
  end

  private

  def team
    @team ||= Team.find_by(slug: params[:id])
  end

  helper_method :team
end
