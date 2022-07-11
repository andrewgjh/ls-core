=begin 
INPUT IS an integer


=end

def perimeter(n)
  fib = [1,1]
  until fib.size - 1 == n
    fib.push(fib[-1]+fib[-2])
  end
  fib.sum * 4
end


p perimeter(5) == 80
p perimeter(7) == 216
p perimeter(20) == 114624
p perimeter(30) == 14098308
p perimeter(100) == 6002082144827584333104