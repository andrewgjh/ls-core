def unegyptian(arr_denoms)
  arr_denoms.map {|num| Rational(1,num)}.sum  
end

def egyptian(rational_frac)
  denoms = []
  num = 1
  loop do
    if rational_frac - Rational(1, num) >= 0 
      rational_frac -= Rational(1, num)
      denoms << num
    end
    num += 1
    break if rational_frac == 0 
  end
  denoms
end


p egyptian(Rational(2, 1))    == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
 
p unegyptian([1, 2, 3, 6]) == Rational(2, 1)
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)


