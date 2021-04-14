module ActsAsCsv

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = 'demo.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')
            file.each {|row| @csv_contents  << row.chomp.split(', ')}
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
