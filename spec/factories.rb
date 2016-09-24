FactoryGirl.define do
  sequence(:email) { |n| "user.#{n}@sula.co" }

  factory :user do
    email { generate :email }
    password 'p4$$w0rd'
    password_confirmation 'p4$$w0rd'
  end

  factory :member do
    team
    name 'Ripley'
    manager false

    factory :manager do
      name 'Apone'
      manager true
      user
    end
  end

  factory :team do
    name 'Sulaco'
  end

  factory :invitation do
    member
    email { generate(:email) }

    before(:create) do |invitation|
      invitation.sender = FactoryGirl.create(:manager, team: invitation.team)
    end
  end
end
