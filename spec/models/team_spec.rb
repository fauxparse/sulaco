require 'rails_helper'

RSpec.describe Team, type: :model do
  subject(:team) { FactoryGirl.create(:team, name: 'Sulaco') }

  it { is_expected.to validate_presence_of :name }

  describe '#to_param' do
    subject(:to_param) { team.to_param }
    it { is_expected.to eq 'sulaco' }
  end
end
