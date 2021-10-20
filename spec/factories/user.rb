FactoryBot.define do
  factory :user do
    username { 'user123' }
    password { 'user123' }
    full_name { 'System User' }
    traits_for_enum :role, { user: 0, admin: 1 }
  end
end
