class Minilang
  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  
  def initialize(commands)
    @commands = commands.split
    @stack = []
    @register = 0
  end

  def eval
    commands.each do |action|
      if integer?(action)
        @register = action.to_i
      else
        if COMMANDS.include?(action)
          send(action.downcase)
        else
          raise "Invalid token: #{action}"
        end
      end
      rescue StandardError =>e
      puts e.message
    end
  end

  private
  attr_accessor :stack, :register
  attr_reader :commands

  

  def integer?(input)
    Integer(input) rescue false
  end

  def pop
    raise "Empty stack!" if stack.empty? 
    @register = stack.pop
  end

  def push
    stack << register
  end
  
  def mult
    @register *= pop
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def print
    puts register
  end

end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)