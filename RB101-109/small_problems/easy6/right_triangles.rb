# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(size)
  row = 1
  while row <= size
    num_spaces = " " * (size - row)
    num_stars = "*" * row
    puts "#{num_spaces}#{num_stars}"
    row += 1
  end
end

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |_n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
