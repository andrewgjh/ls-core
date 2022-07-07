# Complete the solution so that it returns the number of times the search_text is found within the full_text. 

def solution(full_text, search_text)
  full_text.scan(search_text).size
end



p solution('abcdeb','b')== 2
p solution('abcdeb', 'a')== 1
p solution('abbc', 'bb')== 1