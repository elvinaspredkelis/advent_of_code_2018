sum = 0
File.open("inputs/input_day_1.txt", "r") do |f|
  f.each_line do |line|
    line[0] == '+' ? sum += line[1..-1].to_i : sum -= line[1..-1].to_i
  end
end
puts sum
