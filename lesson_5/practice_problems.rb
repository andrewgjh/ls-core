arr = ['10', '11', '9', '7', '8']

arr.sort {|a,b| b.to_i <=> a.to_i}

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted = books.sort_by do |book|
  book[:published]
end

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr1.last.last.last
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr2.last[:third].first
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3.last[:third].first[0]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh1['b'].last
hsh1['b'][1]


hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

hsh2[:third].keys[0]
hsh2[:third].key(0)

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0 
munsters.each_value do |fam_member|
  total_age += fam_member["age"] if fam_member["gender"] == "male"
end

munsters.select {|_,v| v["gender"] == "male"}.sum {|_,v| v["age"] }

munsters.values.sum {|el| el["gender"] == "male" ? el["age"] : 0}

munsters.each do |name, stats|
  puts "#{name} is a #{stats["age"]}-year-old #{stats["gender"]}"
end

a = 2
b = [5, 8]
arr = [a, b]
# arr = [2, [5, 8]]


arr[0] += 2
# arr = [4,[5, 8]]
# a = 2

arr[1][0] -= a

p arr
p b
# arr = [4, [3, 8]]
# b = [3, 8]

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |_,str_arr|
  str_arr.each do |str|
    str.each_char do |char|
      puts char if vowels.include?(char)
    end
  end
end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]


sorted = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

og_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

updated_arr = og_arr.map do |el|
  new_hsh = {}
  el.each {|k,v| new_hsh[k] = v + 1}
  new_hsh
end

updated_arr = og_arr.map do |el|
  el.to_h {|k,v| [k, v+1]}
end 

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

answer = arr.map do |sub_arr|
  sub_arr.select {|num| num % 3 == 0}
end

answer = arr.map do |sub_arr|
  sub_arr.reject {|num| num % 3 != 0}
end

answer = arr.map do |sub_arr|
  sub_arr.select {|num| num % 3 == 0}
end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
expected_hash = {}
arr.each {|el| expected_hash[el.first]= el.last}

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorted = arr.sort_by do |sub_arr|
  sub_arr.select {|num| num.odd?}
end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
final_arr = []

hsh.each do |_,v|
  if v[:type] == "fruit"
  colors_arr = v[:colors].map {|color| color.capitalize}
  final_arr << colors_arr
  elsif v[:type] == "vegetable"
  final_arr << v[:size].upcase
  end
end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

testing = arr.select do |hsh|
  hsh.values.flatten.all?{|num| num.even?}
end

p testing
