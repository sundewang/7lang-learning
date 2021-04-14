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

class CsvRow
    def initialize(headers, row)
        @headers = headers
        @row = row
    end

    def method_missing name, *args
        name_str = name.to_s
        @row[@headers.index(name_str)]
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv

    def each
        @csv_contents.each {|row| yield CsvRow.new(@headers, row)}
    end
end

csv = RubyCsv.new
csv.each {|row| puts row.name}
