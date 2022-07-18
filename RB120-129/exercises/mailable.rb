module Mailable
  def print_address
    puts (name).to_s
    puts (address).to_s
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  attr_reader :name, :address, :city, :state, :zipcode

  include Mailable
end

class Employee
  attr_reader :name, :address, :city, :state, :zipcode

  include Mailable
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address
