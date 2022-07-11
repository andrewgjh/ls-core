# You wake up at the control board of a submarine. In front of you is a panel of buttons and a note left by the previous captain: "Use the buttons to set the ship's depth, and aim for as close to n leagues as possible -- but definitely don't go lower! You can select only one set of buttons, and *together* they determine the depth. Here's the last course I set: 2. And I was aiming to be lower than 7.

# The buttons in front of you are as follows:
# 2
# 3
# 1
# 2
# 4
# 3

# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.


=begin

Problem
  - input is an array of positive integers and a target positive integer to reach
  - find the minimum lenght subarr that would be greater or equal to the target integer
Example 
  - ships_depth([2,3,1,2,4,3], 7) == 2

  # p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
  # p minSubLength([1, 10, 5, 2, 7], 9) == 1
  # p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
  # p minSubLength([1, 2, 4], 8) == 0
Data Structure
  - 
ALGO

high level 

get all subarrays of different length and return the length of first subarray that is equal to or above the target 

  - run a loop 1 up to arr.size  
  - and then call each_cons on the input array with that number
    - then on that returned array, i would call any? method that would sum up the array and check if any are above or equal to the target
    - if there is i would return that number
  
  if finished the loop then return 0 

=end

=begin


# Advanced PEDAC Study Session

=begin
I have interviewed five software engineering candidates over the past two weeks, including folks with grad degrees in computer science/ex-FAANG with 7+ years of experience. All five were jointly rejected by myself and a co-interviewer either because the candidates jumped straight into implementation and ended up with bugs during testing or unhandled edge cases, and/or their oral-written communication was poor.

So, for those folks who are 'PEDACing' for the first few times:
1) Train your problem solving muscles to start with PEDAC by default (or some equivalent thereof);
2) Get comfortable talking through problems out loud, not just typing silently.

Can't stress enough that PEDAC isn't an arbitrary heuristic meant for getting through the curriculum or 109/129 oral assessments. PEDAC works, especially under pressure.

- Sam Swire (Check)
=end



=begin
Algorithm:
- Goal: write out steps to solve the given problem in plain English
- A logical sequence of steps for accomplishing a task/objective
- Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
- Stay programming-language-agnostic
- Can create substeps for different parts or separate concerns into a helper method
- You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
- Before moving onto implementing the algorithm, check it against a few test cases
=end

=begin
Code
- Goal: translate the algorithm into your programming language of choice
- Code with intent. Avoid hack and slash - TEST FREQUENTLY
- Use the REPL or run your code as a file
- When testing your code, always have an idea in place of what you're expecting
=end

=begin
You wake up at the control board of a submarine. In front of you is a panel of buttons and a note left by the previous captain: "Use the buttons to set the ship's depth, and aim for as close to _ leagues as possible -- but definitely don't go higher! You can select only one set of buttons, and *together* they determine the depth. Here's the last course I set: 2. And I was aiming to be deeper than 7.

The buttons in front of you are as follows:
2
3
1
2
4
3
=end

# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

# Iterate through the array. If a sequence of ints is sum >= integer, push into new array. Then compare those ints for min value.

=begin ISAAC






=end

=begin BRENNO

Given an array of integers and an Integer:
Iterate over the array and find all the possible subarrays contained in it whose sum of elements is equal to or greater than the input integer.
Store the subarrays that meet such condition into a new array. Compare the stored subarrays and return those with the smallest sum of elements, storing the return in a new array. Compare the size of the resulting arrays and return the size of the array with the smallest size.





=end

=begin MATT






=end

=begin ANDREW

high level 

get all subarrays of different length and return the length of first subarray that is equal to or above the target 


low level
  - run a loop 1 up to arr.size  
  - and then call each_cons on the input array with that number
    - then on that returned array, i would call any? method that would sum up the array and check if any are above or equal to the target
    - if there is i would return that number
  
  if finished the loop then return 0 


def minSubLength(arr, target)
  return 0 if arr.empty?
  1.upto(arr.size) do |num|
    subarrs = arr.each_cons(num)
    return num if subarrs.any? {|sub_arr| sub_arr.sum >= target}
  end
  return 0
end

=end

=begin JD

def get_subs(array)
  0.upto(array.size).with_object([]) do |idx, sub_arrays|
    count = 1
    until count > (array.size - idx)
      sub_arrays << array[idx, count]
      count += 1
    end
  end
end

def minSubLength(buttons, depth)
  sub_buttons = get_subs(buttons)
  possible_sequence = sub_buttons.select do |string_of_buttons|
                        string_of_buttons.sum >= depth
                      end
                      
  possible_sequence.sort_by! do |sequence|
    sequence.length
  end
  possible_sequence.empty? ? 0 : possible_sequence[0].size
end

get subarray of button sequences
  iterate 'start' from 0 to one less than array size
      have a iterating counter set to 1
        while counter is less or equal to the array.size - 'start'
          push array at 'start' index for counter length to subarrays array
          add one to counter
return subarrays


# select subarrays who's sum adds up to or is equal to depth
      iterate through subarrays
        select any subarrays whose sum is greater tahn or equal to depth
# sort the array of button sequences by the length of the sequences
      sort the return of selection iteration by the size of the sub_arrays
# return the shortest sequence of number's size
  if the selected sub_arrays is empty
    return 0
  else
    return the size of the sub_array at index 0

=end




def minSubLength(arr, target)
  return 0 if arr.empty?
  1.upto(arr.size) do |num|
    subarrs = arr.each_cons(num)
    return num if subarrs.any? {|sub_arr| sub_arr.sum >= target}
  end
  return 0
end


  p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
  p minSubLength([1, 10, 5, 2, 7], 9) == 1
  p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
  p minSubLength([1, 2, 4], 8) == 0


  