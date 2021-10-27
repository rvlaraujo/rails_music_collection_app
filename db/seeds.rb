require 'faker'

def create_user(user)
  if User.find_by(username: user.username).nil?
    user.save!
  end
end

create_user(User.new(username: 'administrator', full_name: 'Administrator', password: 'administrator', password_confirmation: 'administrator',
                     role: User.roles[:admin]))
create_user(User.new(username: 'commonuser', full_name: 'Common User', password: 'commonuser', password_confirmation: 'commonuser',
                     role: User.roles[:user]))

## Setting up the Artists List
client = MoatClient.new
artists = client.all_artists

## creating albums
(1..35).each do |_e|
  Album.find_or_create_by!(artist_id: artists.sample.id, name: Faker::Music.album,
                           year: Faker::Number.between(from: 1980, to: 2021))
end
