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

def star_2
  crates = File.open('inputs/input_day_2.txt').read.chomp.split("\n")
  crates.each_with_index do |first_crate, i|
    (i + 1..crates.length - 1).each do |j|
      second_crate = crates[j]
      delta = 0

      first_crate.each_char.with_index do |char, k|
        delta += 1 unless char == second_crate.chars[k]
      end

      base = second_crate.split(//)
      subtraction = first_crate.split(//)
      difference = (base - (base - subtraction)).join

      return difference if delta == 1
    end
  end
end
puts "Second solution: #{star_2}"
