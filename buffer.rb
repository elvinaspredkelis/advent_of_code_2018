re = /^#(\d+)\s@\s(\d+),(\d+): (\d+)x(\d+)$/
input = File.readlines('inputs/input_day_3.txt').map do |line|
  line.match(re).captures.map(&:to_i)
end

cuts = Hash.new(0)
size = input.size

input.each do |_, x, y, m, n|
  x.upto(x + m - 1).each do |i|
    y.upto(y + n - 1).each do |j|
      cuts[i * size + j] += 1
    end
  end
end

puts cuts.values.reduce{|t, x| x > 1 ? t + 1 : t}

input.each do |id, x, y, m, n|
  valid = true
  # puts "ID: #{id} - X: #{x} - Y: #{y} - M: #{m} - N: #{n}"
  puts cuts
  x.upto(x + m - 1).each do |i|
    y.upto(y + n - 1).each do |j|
      valid = false if cuts[i * size + j] > 1
    end
  end

  puts id if valid
end