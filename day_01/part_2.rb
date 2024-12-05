# determine how often each number on the left list appears on the right list

# calculate a similarity score by (left num) * (right num occurrences)

# get a sum for all similarity scores

# similarity_score = (left num) * (num of occurrences on right)

input_data = File.read('input.txt').split

row1 = []
row2 = []

input_data.each_with_index do |num, idx|

  if idx % 2 == 0
    row1 << num.to_i
  else
    row2 << num.to_i
  end

end

row1 = row1.sort
row2 = row2.sort

total_summary_score = 0

row1.each do |left_num|
  occurrences = row2.count { |right_num| left_num == right_num }

  similarity_score = left_num * occurrences

  total_summary_score += similarity_score
end

puts total_summary_score
