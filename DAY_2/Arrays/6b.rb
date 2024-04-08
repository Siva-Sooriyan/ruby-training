def Bubble_sort(arr)
  n = arr.length

  (0...n).each do |i|
    (0...n-i-1).each do |j|
      if arr[j] > arr[j+1]
        arr[j], arr[j+1] = arr[j+1], arr[j]
      end
    end
  end
  arr
end

puts "Enter numbers separated by spaces:"
input = gets.chomp
arr = input.split.map(&:to_i) 
sorted_array = Bubble_sort(arr)
puts "Sorted array: #{sorted_array}"
