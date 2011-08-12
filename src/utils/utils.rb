def show_set_values(set)
  str = []
  set.each do |elem|
    str << elem.upcase
  end
  str.join(",")
end