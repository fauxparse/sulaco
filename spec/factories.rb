FactoryGirl.define do
  factory :member do
    team
    name 'Ripley'
    manager false

    factory :manager do
      name 'Apone'
      manager true
    end
  end

  factory :team do
    name 'Sulaco'
  end
end
