# For reuse the behavior of an call method to service objects
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
