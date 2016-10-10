require 'rails_helper'

RSpec.describe InvitationsController, type: :request do
  let(:invitation) { FactoryGirl.create(:invitation) }
  let(:user) { FactoryGirl.create(:user).tap(&:confirm) }

  describe '#accept' do
    context 'when logged in' do
      before do
        sign_in user
      end

      it 'redirects to the team page' do
        get accept_invitation_path(invitation)
        expect(response).to redirect_to team_path(invitation.team)
      end

      it 'connects the member with the user' do
        get accept_invitation_path(invitation)
        expect(invitation.member.reload.user).to eq user
      end
    end
  end
end
