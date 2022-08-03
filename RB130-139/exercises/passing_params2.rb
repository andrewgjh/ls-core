birds = %w(raven finch hawk eagle)
def raptors(arr)
  yield(arr)
end

raptors(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}" }
