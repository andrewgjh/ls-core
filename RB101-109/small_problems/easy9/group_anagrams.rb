words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live', 'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']

# go through each word and make hash map of the number of characters and push map into an array
# if map already exists in the array then group those words together

def char_occurences(word)
  occur_hsh = Hash.new(0)
  word.chars.each { |char| occur_hsh[char] += 1 }
  occur_hsh
end

def group_anagrams(word_arr)
  key = []
  group_words = Hash.new { |h, k| h[k] = [] }
  word_arr.each do |word|
    hsh_map = char_occurences(word)

    if key.include?(hsh_map)
      idx = key.index(hsh_map)
      group_words[idx] << word
    else
      key << hsh_map

    end
  end
  p group_words
end

group_anagrams words

# _____________________________________________

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end
