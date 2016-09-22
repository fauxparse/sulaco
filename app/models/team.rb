class Team < ApplicationRecord
  acts_as_url :name,
    url_attribute: :slug,
    limit: 64

  has_many :members

  validates :name, presence: true

  def to_s
    name
  end

  def to_param
    slug
  end
end
