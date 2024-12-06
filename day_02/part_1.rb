require 'byebug'

input_file = File.read('input.txt')

input_data = input_file.split("\n")

line_data = input_data.map do |line|
  line.split.map { |report_num| report_num.to_i }
end

# pp line_data

def all_differences_same?(differences)
  differences.all? { |diff| diff < 0 } || differences.all? { |diff| diff > 0 }
end

def line_safe?(line)
  # Store the difference amounts between each consecutive report num
  difference_amounts = []

  # Find difference of each consecutive pair of report nums
  line.each_cons(2) do |report_nums|
    pp report_nums
    difference_amounts << (report_nums[0] - report_nums[1])
  end

  # Check if all numbers are increasing or all decreasing
  return false if difference_amounts.any?(0)
  return false unless all_differences_same?(difference_amounts)

  # pp difference_amounts

  # Return true (safe) if all diff amounts are less than 3
  difference_amounts.all? { |diff_amount| diff_amount.abs <= 3 }
end

# Collect report safety results for all lines
report_safety = line_data.map do |line_row|
  line_safe?(line_row)
end

# Return amount of safe reports
safe_report_count = report_safety.count { |report| report }

# pp report_safety
pp safe_report_count
