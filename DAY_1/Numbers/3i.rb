#  Number of substrings that are divisible by 6 

def sub_string_divisible str
  count = 0

  (0...str.length).each do |i|
    num = 0
    (i...str.length).each do |j|
      num = num * 10 + str[j].to_i
      count += 1 if num % 6 == 0
    end
  end

  count
end


puts"Enter a number"
num = gets.chomp
result = sub_string_divisible(num)
puts "Number of Substrings divisible by 6 are #{result}"