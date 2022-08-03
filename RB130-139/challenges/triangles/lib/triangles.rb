class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless triangle?
  end

  def kind
    case @sides.uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  def triangle?
    @sides.none? { |side| side <= 0 } &&
      two_greater_than_third
  end

  def two_greater_than_third
    (@sides[0] + @sides[1]) > @sides[2] &&
      (@sides[0] + @sides[2]) > @sides[1] &&
      (@sides[1] + @sides[2]) > @sides[0]
  end
end
