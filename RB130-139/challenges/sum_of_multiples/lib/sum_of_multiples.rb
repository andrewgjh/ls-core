# class SumOfMultiples
#   def initialize(*set_nums)
#     @set_nums = (set_nums.size > 0) ? set_nums : [3, 5];
#   end

#   def to(end_num)
#     @set_nums.map do |start_num|
#       multiples(start_num, end_num)
#     end.flatten.uniq.sum
#   end

#   def self.to(num)
#     SumOfMultiples.new.to(num)
#   end

#   private

#   def multiples(starting, ending)
#     multiply_list = []
#     counter = 1
#     while starting * counter < ending
#       multiply_list << starting * counter
#       counter += 1
#     end
#     multiply_list
#   end
# end

class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = !multiples.empty? ? multiples : [3, 5]
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end
