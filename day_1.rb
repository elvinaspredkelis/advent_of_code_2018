def star_1
  sum = 0
  File.open("inputs/input_day_1.txt", "r") do |f|
    f.each_line do |line|
      line[0] == '+' ? sum += line[1..-1].to_i : sum -= line[1..-1].to_i
    end
  end
  sum
end
puts "First solution: #{star_1}"

def star_2
  current_frequency = 0
  frequencies = { 0 => 1 }
  unique = true

  while unique
    File.open("inputs/input_day_1.txt", "r") do |f|
      f.each_line do |line|
        break unless unique

        if line[0] == '+'
          current_frequency += line[1..-1].to_i
        else
          current_frequency -= line[1..-1].to_i
        end

        return current_frequency if frequencies.key? current_frequency
        frequencies[current_frequency] = 1
      end
    end
  end
end
puts "Second solution: #{star_2}"
