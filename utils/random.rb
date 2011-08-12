require "utils/logging"

class Random
    def self.choice(list)
        list[rand(list.length)]
    end

    def self.choices(list, minimum=1)
        if list.length < minimum
            raise "list must have at least #{minimum} elem"
        end
        list = Array.new(list)
        chosen = []
        how_many = rand(list.length)
        if how_many < minimum
            how_many = minimum
        end
        
        (1..how_many).each do |i|
            elem = choice(list)
            chosen << elem
            list.delete(elem)
        end
        chosen
    end
end

def random_item_id(i)
    r = 1000000 + rand(1000000)
    i = i.to_s.rjust(4)
    i = i.gsub(' ', '0')
    "#{r.to_s}#{i}" 
end