require_relative '../../data-structures/binary-tree'

def read_report(report)
    tree_0 = BinaryTree.new(0)
    tree_1 = BinaryTree.new(0)

    report.each do |line|        
        bytes = line.strip.chars
        case bytes.shift
        when '1'      
            tree_1.push_binary_array(bytes)
        when '0'
            tree_0.push_binary_array(bytes)
        end        
    end

    if tree_0.root_node.value > tree_1.root_node.value
        o2_rating = tree_0.traverse_binary_tree(true, '0')
        co2_rating = tree_1.traverse_binary_tree(false, '1')
    else
        o2_rating = tree_1.traverse_binary_tree(true, '1')
        co2_rating = tree_0.traverse_binary_tree(false, '0')
    end

    puts "o2: #{o2_rating.to_i(2)}"
    puts "co2: #{co2_rating.to_i(2)}"
    puts "life_support: #{o2_rating.to_i(2) * co2_rating.to_i(2)}"
end

def read_input
    File.open('input.txt', 'r') do |f|
        read_report(f)
    end
end


read_input