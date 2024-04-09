# Quick sort

def quick_sort(arr,low,high)
  pivot = arr[low]
  i = low + 1
  j = high
  while(i < j)
    i +=1 while arr[i] <= pivot && i <= high - 1
    j -=1 while arr[j] > pivot && j >= low + 1

    if i < j
      arr[i],arr[j] = arr[j],arr[i]
    end
  end
  arr[low],arr[j] = arr[j],arr[low]
  j
end

def divide(arr,low,high)
  if low < high 
    p = quick_sort(arr,low,high)
    divide(arr,low,p-1)
    divide(arr,p+1,high)
  end
end

puts "Enter a array"
arr = gets.chomp.split(' ').map(&:to_i)
divide(arr,0,arr.length-1)
puts arr.inspect