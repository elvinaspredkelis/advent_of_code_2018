def star_1
  twos = threes = 0
  File.open("inputs/input_day_2.txt", "r") do |f|
    f.each_line do |line|
      count = {}
      line.strip.chars.each do |c|
        count[c] = 0 unless count.key? c
        count[c] += 1
      end
      twos += 1 if count.value?(2)
      threes += 1 if count.value?(3)
    end
  end
  twos * threes
end
puts "First solution: #{star_1}"
