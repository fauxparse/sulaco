class Invitation < ApplicationRecord
  TOKEN_LENGTH = 48

  belongs_to :member
  belongs_to :sender, class_name: 'Member'
  has_one :team, through: :member

  before_validation :generate_token

  validates :email, presence: true, format: { with: User.email_regexp }
  validates :token,
    presence: true,
    uniqueness: true,
    format: { with: /\A[0-9a-f]{#{TOKEN_LENGTH}}\z/ }

  def to_param
    token
  end

  private

  def generate_token
    while token.blank? || Invitation.where(token: token).not(self).exists?
      self.token = SecureRandom.hex(TOKEN_LENGTH / 2)
    end
  end
end
