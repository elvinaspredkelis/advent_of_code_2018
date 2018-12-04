def star_1
  grid = Array.new(1000) { Array.new(1000) { 0 } }

  File.open('inputs/input_day_3.txt', 'r') do |f|
    f.each_line do |line|
      coordinates = line.split(' @ ')[1].split(': ')
      sx = coordinates[0].split(',')[0].to_i
      sy = coordinates[0].split(',')[1].to_i
      w = coordinates[1].delete("\n").split('x')[0].to_i
      l = coordinates[1].delete("\n").split('x')[1].to_i

      (sx..sx + w - 1).each do |x|
        (sy..sy + l - 1).each do |y|
          grid[x][y] += 1
        end
      end
    end
  end
  grid.flatten.count { |square| square > 1 }
end
puts "First solution: #{star_1}"

def star_2
  claims = File.open('inputs/input_day_3.txt').read.chomp.split("\n")
  grid = Array.new(1000) { Array.new(1000) { 0 } }

  claims.each_with_index do |claim|
    coordinates = claim.split(' @ ')[1].split(': ')
    sx = coordinates[0].split(',')[0].to_i
    sy = coordinates[0].split(',')[1].to_i
    w = coordinates[1].delete("\n").split('x')[0].to_i
    l = coordinates[1].delete("\n").split('x')[1].to_i

    (sx..sx + w - 1).each do |x|
      (sy..sy + l - 1).each do |y|
        grid[x][y] += 1
      end
    end
  end

  claims.each_with_index do |claim, i|
    coordinates = claim.split(' @ ')[1].split(': ')
    sx = coordinates[0].split(',')[0].to_i
    sy = coordinates[0].split(',')[1].to_i
    w = coordinates[1].delete("\n").split('x')[0].to_i
    l = coordinates[1].delete("\n").split('x')[1].to_i
    intact = true

    (sx..sx + w - 1).each do |x|
      (sy..sy + l - 1).each do |y|
        intact = false if grid[x][y] > 1
      end
    end

    return i + 1 if intact
  end
end
puts "Second solution: #{star_2}"
