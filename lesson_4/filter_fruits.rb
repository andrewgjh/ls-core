produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  produce.select {|_,v| v == "Fruit"}
end

# def select_fruit(produce)
#   return_hash = {}
#   hash_keys = produce.keys
#   hash_keys.each do |key|
#     if produce[key] == "Fruit"
#       return_hash[key] = "Fruit"
#     end
#   end
#   return_hash
# end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p produce