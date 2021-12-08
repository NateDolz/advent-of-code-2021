class Sub
    attr_reader :horizontal, :depth

    def initialize
        @horizontal = 0
        @depth = 0
    end    

    def forward(x)
        @horizontal = @horizontal + x
    end

    def up(x)
        @depth = @depth - x
    end

    def down(x)
        @depth = @depth + x
    end 

    def prod
        @horizontal * @depth
    end
end

def process_instructions(instructions)
    submarine = Sub.new()
    instructions.each do |instr|
        parts = instr.split(/ /)
        case parts[0]
        when 'forward'
            submarine.forward(parts[1].to_i)
        when 'up'
            submarine.up(parts[1].to_i)
        when 'down'
            submarine.down(parts[1].to_i)
        end
    end
    puts "product = #{submarine.prod}"
end

def read_input
    File.open('input.txt', 'r') do |f|
        process_instructions(f)
    end
end


read_input