file_data = File.read('input.txt').split

row1 = []
row2 = []

file_data.each_with_index do |number, idx|

  if idx % 2 == 0
    row1 << number.to_i
  else
    row2 << number.to_i
  end

end

difference = 0
index = 0

until index >= row1.size do
  difference += (row1[index] - row2[index]).abs

  index += 1
end

puts difference
