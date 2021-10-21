class Artist
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :name, :twitter

  def initialize(response_array)
    @id = response_array[0][:id]
    @name = response_array[0][:name]
    @twitter = response_array[0][:twitter]
  end
end
