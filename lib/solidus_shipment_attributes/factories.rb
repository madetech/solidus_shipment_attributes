FactoryGirl.modify do
  factory :shipping_method do
    trait :with_description do
      description 'Super Made Tech shipping method'
    end
  end
end
