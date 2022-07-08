=begin
INPUT is a string with characters and the # character
OUTPUT is a cleaned up string where # is was considered a backspace and therefore removes a character

ALGO
initialize a new output and set to []
break up the input string into characters
loop through each character
if character is # then pop the last character from output_string
else push that character to the output array

	join the output array and return
=end


def clean_string(string)
	output = []
	string.chars.each do |char|
		char == "#" ? output.pop : output << char
	end
	output.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == "" 