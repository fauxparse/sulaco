require 'rails_helper'

RSpec.describe Member, type: :model do
  subject(:member) { FactoryGirl.create(:member, name: 'Ripley') }

  it { is_expected.to validate_presence_of :name }
  it do
    is_expected.to validate_uniqueness_of(:name)
      .scoped_to(:team_id)
      .case_insensitive
  end
  it { is_expected.to validate_presence_of :team }

  describe '#to_s' do
    subject(:to_s) { member.to_s }
    it { is_expected.to eq 'Ripley' }
  end

  describe '#to_param' do
    subject(:to_param) { member.to_param }
    it { is_expected.to eq 'ripley' }
  end

  describe '#email' do
    subject(:email) { member.email }
    it { is_expected.not_to be_present }
  end

  describe '#email?' do
    subject(:email) { member.email? }
    it { is_expected.to be false }
  end

  context 'who is a manager' do
    subject(:member) { FactoryGirl.build(:manager, name: 'Apone') }

    it { is_expected.to be_valid }

    context 'without an associated user' do
      before { member.user = nil }
      it { is_expected.not_to be_valid }
    end
  end

  context 'with an attached user' do
    subject(:member) do
      FactoryGirl.create(
        :member,
        :with_attached_user,
        name: 'Ripley',
        email: 'ripley@sula.co'
      )
    end

    describe '#email' do
      subject(:email) { member.email }
      it { is_expected.to eq 'ripley@sula.co' }
    end

    describe '#email?' do
      subject(:email) { member.email? }
      it { is_expected.to be true }
    end
  end
end
