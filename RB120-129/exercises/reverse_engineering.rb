class Transform
  def self.lowercase(chars)
    chars.downcase
  end
  attr_reader :characters
  def initialize(characters)
    @characters = characters
  end
  def uppercase
    characters.upcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')