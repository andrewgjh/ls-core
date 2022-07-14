=begin
INPUT has two parameters the start index where the ball is currently located
an array of arrays that indicate the swaps between certain indexes
OUTPUT is an integer representing the index where the ball ends at the end of all the swaps

ALGO
set ball_index = start
loop through the swaps
  if the swap includes the current ball index 
  then set the ball_index what it currently isnt

  return ball_index

=end



def find_the_ball start, swaps
  ball_index = start
  swaps.each do |swap|
    if swap.include?(ball_index)
      new_position = swap.index {|idx| idx != ball_index}
      ball_index = swap[new_position]
    end
  end
  ball_index
end

def find_the_ball start, swaps
  ball_index = start
  swaps.each do |swap|
    ball_index = swap[swap.index(ball_index) - 1] if swap.include?(ball_index)
  end
  ball_index
end

swaps = [[0, 1], [1, 2], [1, 0]]
p find_the_ball(0, swaps) == 2