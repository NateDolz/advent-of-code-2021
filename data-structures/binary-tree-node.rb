class TreeNode
    attr_accessor :left, :right, :value

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end

    def to_string()
        value = "#{node.left ? node.left.value : '-'} xxx #{node.right ? node.right.value: '-'}"
    end
end