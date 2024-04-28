#Counting sort

def counting_sort arr
  max_value = arr.max()
  max_value = max_value + 1

  hash_array = Array.new(max_value,0)
  
  arr.each do |i|
    hash_array[i] +=1
  end

  new_array = []
  hash_array.each_with_index do |value,index|
    value.times do new_array<<index if value != 0
    end
  end
  new_array.inspect
end

puts "enter an array"
arr = gets.chomp.split(' ').map(&:to_i)
puts counting_sort(arr)