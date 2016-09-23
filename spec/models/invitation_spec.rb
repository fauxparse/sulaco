require 'rails_helper'

RSpec.describe Invitation, type: :model do
  subject(:invitation) { FactoryGirl.create(:invitation) }

  describe '#token' do
    subject(:token) { invitation.token }

    it { is_expected.not_to be_blank }

    it 'is used as the param value' do
      expect(invitation.to_param).to eq token
    end
  end
end
