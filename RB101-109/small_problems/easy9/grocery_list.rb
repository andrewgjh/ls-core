def buy_fruit(grocery_list)
  final_list = []
  grocery_list.each do |item| 
    item[1].times {final_list << item[0]}
  end
  final_list
end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]