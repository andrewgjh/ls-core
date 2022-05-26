# a method that returns the sum of two integers #

# take two numbers
# add the first number to the second number and save to variable
# return the result

# # START 
# GET two variables
# SET added_num to addition of the two numbers
# PRINT the computed variable added_num
# # END

def add(x,y)
  added_num = x + y
end


## a method that takes an array of strings, and returns a string that is all those strings concatenated together ##

# get string array
# set an empty string variable called concatenated
# iterate through the the string array and concat the current string to the concatenated variable
# when the loop completes
# return the concatenated variable

# # START 
# GET array of strings
# SET concatenated to empty string
# WHILE there are elements not looked at in array
# take the current element you are looking at and concat it to the current concatenated variable
# END
# PRINT the computed variable added_num
# # END

def concat_str_arr(arr)
  concatenated = ""
  arr.each {|element| concatenated += element}
  concatenated
end

### a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. ### 

# get the arr of integers
# initialize variable called every_other and set to empty array
# initialize variable called current_index to 0
# while current_index is less than or equal to arr.length - 1
# access the element in the array at the current_index and push it to the every_other array variable
# increment current_index by 2
# end


def every_other(arr)
  every_other = []
  current_index = 0
  while current_index < arr.length
    every_other.push(arr[current_index])
    current_index += 2
  end
end

####  a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil. ####

# get the character you are looking for and the string you are searching
# set a variable called three_times to 3
# set a variable called index and set to 0
# while the string at the current index is less than or each to string.length -1
# check if the current character is equal to the string you are looking for
  # if it is equal than decrement the variable three times by 1
  # check if three_times equal to 0 than break out of the while loop early
# end
# finally check if three_times is equal to 0 if yes then return current_index
# if no, then return nil

def three_times?(str, char)
  three_times = 3
  current_index = 0
  while current_index < str.length
    three_times -= 1 if str[current_index] == char
    break if three_times == 0
    current_index +=1
  end
  three_times == 0 ? current_index : nil
end


##### a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. #####

# get first array and second array
# set a variable output_arr to an empty arr
# set a variable called index to 0 
# loop while index is less than or equal to first_array 
# take the element in the first array at the current index and push to output_arr
# take the element in the second array at the current index and push to output_arr
# increment the index by 1
# end
# return the output array

def merger(first_arr, second_arr)
  output_arr = []
  index = 0
  while index < first_arr.length
    output_arr.push(first_arr[index])
    output_arr.push(second_arr[index])
    index += 1
  end
  output_arr
end

