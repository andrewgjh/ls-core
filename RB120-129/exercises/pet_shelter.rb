class Shelter
  def initialize
    @adopted_list = {}
    @adoptions_avail = []
  end
  
  def found_stray(pet)
    adoptions_avail.push(pet)
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    adoptions_avail.each do |pet|
      puts pet
    end
  end

  def num_residences
    puts "The Animal shelter has #{adoptions_avail.size} unadopted pets."
  end

  def adopt(owner, pet)
    owner.pets << pet
    if adopted_list.key?(owner)
      adopted_list[owner] << pet
    else
      adopted_list[owner] = [pet]
    end
  end
  
  def print_adopted_list
    adopted_list.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each {|pet| puts pet}
      puts ""
    end
  end

  private
  attr_accessor :adopted_list, :adoptions_avail
  
end

class Pet
  attr_reader :name, :type

  def initialize(type, name)
    @type = type
    @name = name
  end

    def to_s
    "a #{type} named #{name}"
  end

end

class Owner
  attr_accessor :pets
  attr_reader :name
  def initialize(name)
    @name = name
    @pets = []
  end
  def number_of_pets
    pets.size
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adopted_list
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


troublesome      = Pet.new('monkey', 'Troublesome')
cheeky        = Pet.new('pig', 'Cheeky')
rocky      = Pet.new('bear', 'Rocky')

shelter.found_stray(troublesome)
shelter.found_stray(cheeky)
shelter.found_stray(rocky)

shelter.print_unadopted_pets
shelter.num_residences
