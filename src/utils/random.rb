require "utils/logging"
require "set"

class Random
  def self.choice(list)
    list[rand(list.length)]
  end

  def self.choices(list, minimum=1)
    if list.length < minimum
      raise "list must have at least #{minimum} elem"
    end
    set = Set.new
    how_many = rand(list.length)
    if how_many < minimum
      how_many = minimum
    end

    (1..how_many).each do |i|
      set.add(list.sample)
    end
    set
  end
end

def random_item_id(i)
  r = 1000000 + rand(1000000)
  i = i.to_s.rjust(4)
  i = i.gsub(' ', '0')
  "#{r.to_s}#{i}"
end