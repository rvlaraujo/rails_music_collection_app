FactoryBot.define do
  factory :album do
    artist_id { 1 }
    name { 'Just an Album' }
    year { Date.today.year }
  end
end
