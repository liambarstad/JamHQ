FactoryBot.define do
  factory :user do
    sequence :username do |i|
      "Liam#{i}"
    end
    sequence :email do |i|
      "this_email#{i}"
    end
    first_name 'Liam'
    last_name 'Barstad'
    password 'samplepassword'
  end
end
