# frozen_string_literal: true

def step(starting, ending, step_value)
  current_value = starting
  while current_value <= ending
    yield(current_value) if block_given?
    current_value += step_value
  end
  starting..ending
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
