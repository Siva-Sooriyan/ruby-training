# All Unique elements

def unique_elements(arr)
  value = []
  arr.each do |element|
    value << element unless value.include?(element)
  end
  value
end

puts "Enter a comma-separated array "
input = gets.chomp
arr = input.gsub(/[^\d,]/, '').split(',').map(&:to_i) 
result = unique_elements(arr)
puts "Distinct elements in the array: #{result}"
