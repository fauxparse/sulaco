require 'rails_helper'

RSpec.describe SendInvitation do
  subject(:service) { SendInvitation.new(member, sender) }
  let(:member) { FactoryGirl.create(:member, team: team) }
  let(:sender) { FactoryGirl.create(:manager, team: team) }
  let(:team) { FactoryGirl.create(:team) }

  before do
    member.email = 'bishop@sula.co'
  end

  describe '#call' do
    it 'creates an invitation' do
      expect { service.call }.to change { Invitation.count }.by 1
    end

    it 'sends an email' do
      email = double

      expect(MemberMailer)
        .to receive(:invitation)
        .with(an_instance_of(Invitation))
        .and_return(email)

      expect(email).to receive(:deliver_later)

      service.call
    end
  end
end
