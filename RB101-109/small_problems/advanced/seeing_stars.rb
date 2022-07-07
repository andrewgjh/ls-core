def star(grid_size)
  row = (grid_size / 2.0).floor
  star_top = []
  amount_spaces = row - 1
  row.times do
    spaces = " " * amount_spaces
    current_row = Array.new(3, "*").join(spaces)
    star_top << current_row.center(grid_size)
    amount_spaces -= 1
  end
  star_center = ["*" * grid_size] 
  star_bottom = star_top.reverse

  star = star_top + star_center + star_bottom

  star.each {|line| puts line}
end



star(30)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
