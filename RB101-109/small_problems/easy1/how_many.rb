#Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences1(arr)
  occur_hsh = {}
  arr.each do |el|
    if occur_hsh[el]
      occur_hsh[el] +=1
    else
      occur_hsh[el] = 1
    end
  end
  occur_hsh {|k,v| puts "#{k} => #{v}"}
end

def count_occurrences2(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end


def count_occurrences(arr)
  hsh = arr.inject({}) do |acc, el|
    acc[el] ||= 0
    acc[el] += 1
    acc
  end
  hsh.each {|k,v| puts "#{k} => #{v}"}
end

def count_occurrences_icase(arr)
  hsh = arr.inject({}) do |acc, el|
    case_insensitive = el.downcase
    acc[case_insensitive] ||= 0
    acc[case_insensitive] += 1
    acc
  end
  hsh.each {|k,v| puts "#{k} => #{v}"}
end

count_occurrences(vehicles)


