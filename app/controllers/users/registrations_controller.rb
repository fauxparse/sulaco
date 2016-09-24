module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |user|
        confirm_from_viewed_invitations(user, session.delete(:invitation))
      end
    end

    private

    def confirm_from_viewed_invitations(user, id)
      user.confirm if id.present? && Invitation.where(id: id).exists?
    end
  end
end
