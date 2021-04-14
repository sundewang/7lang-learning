class NilClass
    def blank?
        true
    end
end

class String
    def blank?
        self.size == 0
    end
end

["", "person", nil].each {|e| puts e unless e.blank?}