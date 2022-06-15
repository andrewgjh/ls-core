
def stars_outline(stars_str)
  stars_str.gsub!("*", " ")
  stars_str[0] = "*"
  stars_str[-1] = "*"
end


def diamond(odd_int)
  diamond_top = []

  (1..odd_int).step(2) do |i|
    stars = "*" * i
    stars_outline(stars)
    diamond_top << stars.center(odd_int)
  end

  diamond_bottom = diamond_top.dup[0..-2].reverse
  diamond = diamond_top + diamond_bottom
  diamond.each { |line| puts line }
end

# diamond 10

# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

diamond 7