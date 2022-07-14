=begin

=end




def rolldice_sum_prob(total, num_dice)
  all_rolls = ((1..6).to_a * num_dice).permutation(num_dice).uniq
  correct_rolls = all_rolls.select {|roll| roll.sum == total}.size
  correct_rolls / 6.0**num_dice
end

p rolldice_sum_prob(11, 2) # == 0.0555555555 # or 1/18
p rolldice_sum_prob(8, 2) # ==  0.13888888889# or 5/36
p rolldice_sum_prob(8, 3) # == 0.0972222222222  # or 7/72
p rolldice_sum_prob(22, 3) # == 0