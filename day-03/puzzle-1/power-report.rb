def read_report(report)
    bytes = []
    report.each do |line|
        if bytes.count == 0
            line.strip.chars.reverse.each {|byte| bytes.push(byte.to_i == 1 ? 1 : -1)}
            next
        end
        new_bytes = []
        line.strip.chars.reverse.each_with_index {|byte, pos| new_bytes.push(bytes[pos] + (byte.to_i == 1 ? 1 : -1))}
        bytes = new_bytes.clone
    end

    gamma = 0
    epsilon = 0
    bytes.each_with_index {|byte, power| gamma = gamma + ((byte > 0 ? 1 : 0) * (2 ** power))}
    bytes.each_with_index {|byte, power| epsilon = epsilon + ((byte > 0 ? 0 : 1) * (2 ** power))}

    puts "gamma: #{gamma}, epsilon: #{epsilon}"
    puts "power consumption: #{gamma * epsilon}"
end

def read_input
    File.open('input.txt', 'r') do |f|
        read_report(f)
    end
end


read_input