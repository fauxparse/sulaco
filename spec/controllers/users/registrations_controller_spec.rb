require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  let(:invitation) { FactoryGirl.create(:invitation) }

  describe '#create' do
    context 'after clicking on an invitation link' do
      before do
        allow_any_instance_of(Users::RegistrationsController)
          .to receive(:session)
          .and_return(invitation: invitation.id)
      end

      it 'confirms the new user' do
        post user_registration_path,
          params: { user: FactoryGirl.attributes_for(:user) }
        expect(User.last).to be_confirmed
      end
    end
  end
end
