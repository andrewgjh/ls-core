# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(text, downcase_start=false)
  upcasing = downcase_start
  final = text.chars.map do |char|
    upcasing = !upcasing
    upcasing ? char.upcase : char.downcase
  end
  final.join()
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', true) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', true) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', true) == 'iGnOrE 77 tHe 444 nUmBeRs'
