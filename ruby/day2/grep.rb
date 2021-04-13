# 习题3 把文件中匹配到关键词的那一行文本打印出来

pattern = ".*line.*"
filename = "testfile.txt"

f = File.new(filename)
f.each {|line| puts "#{f.lineno}: #{line}" if line.match?(pattern)}

# f.each do |line|
#     if line.match?(pattern)
#         puts "#{f.lineno}: #{line}"
#     end
# end
