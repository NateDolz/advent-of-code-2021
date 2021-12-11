
require_relative 'binary-tree-node'

class BinaryTree
    attr_reader :root_node

    def initialize (root = nil)
        if root != nil
            @root_node = TreeNode.new(root)
        end
    end

    def push_binary_array(array)
        @root_node.value = @root_node.value + 1
        current_node = @root_node

        array.each do |byte| 
            current_node = push_binary_value(byte, current_node)
        end 
    end

    def push_binary_string(string)
        @root_node.value = @root_node.value + 1
        current_node = @root_node

        string.strip.chars.each do |byte| 
            current_node = push_binary_value(byte, current_node)
        end 
    end

    def push_array(array)
        array.each {|value| push_value(value)}
    end

    def push_string(string)
        string.strip.chars.each {|value| push_value(value)}
    end

    def push_binary_value(value, node = nil)
        if node == nil
            return
        end
        case value
        when '1'
            if node.right 
                node.right.value = node.right.value + 1
            else 
                node.right = TreeNode.new(1)
            end
            return node.right
        when '0'
            if node.left
                node.left.value = node.left.value + 1
            else
                node.left = TreeNode.new(1)                
            end
            return node.left
        end
    end

    def push_value(value, node = nil)
        if node == nil
            if @root_node != nil
                node = @root_node
            else 
                @root_node = TreeNode.new(value)
                return
            end
        end

        if value > node.value
             if node.right
                push_value(value, node.right)
             else 
                node.right = TreeNode.new(value)
             end
        else
            if node.left
                push_value(value, node.left)
             else 
                node.left = TreeNode.new(value)
             end
        end
    end

    def traverse_left()
        traverse_left_from_node(@root_node)
    end

    def traverse_right()
        traverse_right_from_node(@root_node)        
    end

    def traverse_binary_tree(common, start, node = nil)
        if node == nil
            node = @root_node
        end     
        
        if node.right && !node.left
            start = start + '1'
            traverse_binary_tree(common, start, node.right)
        elsif node.left && !node.right
            start = start + '0'
            traverse_binary_tree(common, start, node.left)
        elsif !node.right && !node.left
            return start
        elsif node.right.value >= node.left.value
            if common 
                start = start + '1'
                traverse_binary_tree(common, start, node.right)
            else
                start = start + '0'
                traverse_binary_tree(common, start, node.left)
            end
        else
            if common 
                start = start + '0'
                traverse_binary_tree(common, start, node.left)
            else
                start = start + '1'
                traverse_binary_tree(common, start, node.right)
            end
        end
    end

    def traverse_right_from_node(node)
        if node == nil
            return
        end

        puts node.value

        traverse_right_from_node(node.right)
        traverse_right_from_node(node.left)
    end

    def traverse_left_from_node(node)
        if node == nil
            return
        end

        puts node.value
        
        traverse_left_from_node(node.left)
        traverse_left_from_node(node.right)        
    end
end