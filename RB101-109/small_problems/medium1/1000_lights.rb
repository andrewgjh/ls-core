def toggle(switch)
  switch == 1 ? 0 : 1
end


def lights(number)
  lights = (1..number).map {0}
  number.times do |num|
    non_zero_int = num + 1
    to_toggle = (non_zero_int..number).select {|cur| cur % non_zero_int == 0}
    to_toggle.each {|idx| lights[idx -1 ] = toggle(lights[idx - 1]) }
  end
  lights
end

def lights_on(lights_arr)
  on = []
  lights_arr.each_with_index do |light,idx| 
    on << idx + 1 if light == 1
  end
  on
end




# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)