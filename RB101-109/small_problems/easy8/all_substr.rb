def leading_substrings(text)
  final_arr = []
  idx = 0
  while text.size > idx
    final_arr << text[0, idx + 1]
    idx += 1
  end
  final_arr
end


def substrings(text)
  idx = 0
  all_substr = []
  alpha_num_text = text.delete!("^a-zA-Z0-9")
  while idx < alpha_num_text.size
    subset = alpha_num_text[idx..-1]
    all_substr += leading_substrings(subset)
    idx += 1
  end
  all_substr
end




# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]