require "utils/logging"

class Random
    def self.choice(list)
        list[rand(list.length)]
    end

    def self.choices(list)
        if list.length < 1
            raise 'list must have at least 1 elem'
        end
        list = Array.new(list)
        chosen = []
        how_many = 1 + rand(list.length)
        (1..how_many).each do |i|
            elem = choice(list)
            chosen << elem
            list.delete(elem)
        end
        chosen
    end
end
