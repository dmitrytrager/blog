FactoryGirl.define do
  factory :article do
    title
    body { nil }
    association(:user)
  end
end