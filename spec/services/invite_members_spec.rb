require 'rails_helper'

describe InviteMembers do
  subject(:service) { InviteMembers.new(team, sender, member_params) }
  let(:team) { FactoryGirl.create(:team) }
  let(:sender) { FactoryGirl.create(:manager, team: team) }

  before do
    service.on(:invited) do |happy, sad|
      @happy = happy
      @sad = sad
    end
  end

  describe '#call' do
    context 'with valid params' do
      let(:member_params) do
        [{ name: 'Bishop', email: 'bishop@sula.co' }]
      end

      it 'creates a member' do
        expect { service.call }.to change { team.members.count }.by 1
      end

      it 'creates an invitation' do
        expect { service.call }.to change { Invitation.count }.by 1
      end

      it 'publishes the results' do
        service.call
        expect(@happy).to have_exactly(1).item
        expect(@sad).to be_empty
      end
    end

    context 'with no email address' do
      let(:member_params) do
        [{ name: 'Bishop' }]
      end

      it 'creates a member' do
        expect { service.call }.to change { team.members.count }.by 1
      end

      it 'does not create an invitation' do
        expect { service.call }.not_to change { Invitation.count }
      end

      it 'publishes the results' do
        service.call
        expect(@happy).to have_exactly(1).item
        expect(@sad).to be_empty
      end
    end

    context 'with no name' do
      let(:member_params) do
        [{ email: 'bishop@sula.co' }]
      end

      it 'does not create a member' do
        expect { service.call }.not_to change { team.members.count }
      end

      it 'does not create an invitation' do
        expect { service.call }.not_to change { Invitation.count }
      end

      it 'publishes the results' do
        service.call
        expect(@happy).to be_empty
        expect(@sad).to have_exactly(1).item
      end

      it 'has an error on name' do
        service.call
        expect(@sad.first).to have_exactly(1).error_on(:name)
      end
    end

    context 'with a bad email address' do
      let(:member_params) do
        [{ name: 'Bishop', email: 'bishop' }]
      end

      it 'does not create a member' do
        expect { service.call }.not_to change { team.members.count }
      end

      it 'does not create an invitation' do
        expect { service.call }.not_to change { Invitation.count }
      end

      it 'publishes the results' do
        service.call
        expect(@happy).to be_empty
        expect(@sad).to have_exactly(1).item
      end

      it 'has an error on name' do
        service.call
        expect(@sad.first).to have_exactly(1).error_on(:email)
      end
    end
  end
end
