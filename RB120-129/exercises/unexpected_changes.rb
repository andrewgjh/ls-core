class Person
  attr_reader :first_name, :last_name

  def name=(name)
    name_arr = name.split
    @first_name = name_arr[0]
    @last_name = name_arr.size > 1 ? name_arr[1] : ""
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
