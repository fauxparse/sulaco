class Member < ApplicationRecord
  acts_as_url :name,
    url_attribute: :slug,
    scope: :team_id,
    limit: 64

  belongs_to :team, counter_cache: true

  validates :name, :team, presence: true
  validates :name, uniqueness: { scope: :team_id, case_sensitive: false }

  def to_s
    name
  end

  def to_param
    slug
  end
end
