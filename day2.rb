class Computer
  def initialize(program, noun=12, verb=2)
    @program = program.split(',').map(&:to_i)
    @registers = @program.dup
    # fix program
    @registers[1] = noun
    @registers[2] = verb
  end

  def run
    compute(0)
  end

  def compute position
    if @registers[position] == 99
      return
    else
      if @registers[position] == 1
        @registers[@registers[position + 3]] = @registers[@registers[position+1]] + @registers[@registers[position+2]]
      elsif @registers[position] == 2
        @registers[@registers[position + 3]] = @registers[@registers[position+1    ]] * @registers[@registers[position+2]]
      end
    end
    compute position+4
  end

  def result
    @registers[0]
  end

  def dump
    puts "program = #{@program}"
    puts "registers = #{@registers}"
  end
end


class FindNumbers

  def initialize input
    @input = input
  end
  
  def run
    (0..99).each do |noun|
      @noun = noun
      (0..99).each do |verb|
        @verb = verb
        c = Computer.new(@input, @noun, @verb)
        c.run
        if c.result == 19690720
          puts @noun
          puts @verb
        end
      end
    end
  end
end
