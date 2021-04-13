# 习题2 支持散列表的初始化方法

class NewTree
    attr_accessor :children, :node_name

    def initialize(tree={})
        @node_name = tree.keys[0]
        # puts "node_name #{@node_name}"
        keys = tree[@node_name].keys
        # 这里不用判断keys是否为空数组，因为空数组调用collect方法还是返回空数组
        @children = keys.collect{|element| NewTree.new(tree[@node_name].slice(element))}
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = NewTree.new({'grandpa' => {
    'dad' => {'child1' => {}, 'child2' => {}}, 
    'uncle' => {'child3' => {}, 'child4' => {}}
    }})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
