class Artist
  attr_reader :id, :name, :twitter
 
  def initialize(id:, name:, twitter:)
    @id = id
    @name = name
    @twitter = twitter
  end
end
