# 习题1

# 使用each打印，一次4个
a = []
16.times {a.push rand(100)}
i = 0
a.each do |element|
    print "#{element}"
    i = i + 1
    if i % 4 == 0
        print "\n"
    else
        print ', '
    end
end

# 使用each_slice
puts 'use each_slice method'
a.each_slice(4) {|slice| puts slice.join(", ")}
