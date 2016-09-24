class Member < ApplicationRecord
  acts_as_url :name, url_attribute: :slug, scope: :team_id, limit: 64

  belongs_to :team, counter_cache: true
  belongs_to :user
  has_many :invitations

  validates :name, :team, presence: true
  validates :name, uniqueness: { scope: :team_id, case_sensitive: false }
  validates :user, presence: true, if: :manager?

  def to_s
    name
  end

  def to_param
    slug
  end

  def email
    @email || user.try(:email)
  end

  def email?
    !email.blank?
  end

  attr_writer :email
end
