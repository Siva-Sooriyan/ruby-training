# Sub-array with the given sum

def sub_array_sum(arr,sum)
  count = 0 
  start_index = 0
  end_index = 0
  for i in 0...arr.length
    return start_index,end_index if count == sum
    count += arr[i]
    if count < sum
      end_index +=1
    else count > sum
      count -=  arr[start_index]
      start_index +=1
    end
  end
end

puts "enter a array" 
arr = gets.chomp.split(' ').map(&:to_i)
puts "enter a valid sum"
sum = gets.chomp.to_i
result = sub_array_sum(arr,sum)
puts " Sum found between indexes #{result.inspect} "
