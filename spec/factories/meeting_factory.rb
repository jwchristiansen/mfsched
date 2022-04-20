FactoryBot.define do
  factory :meeting do
    mentor
    fellow
    day { "Friday" }
    period { "PM" }
    slot { 1 }
  end
end
