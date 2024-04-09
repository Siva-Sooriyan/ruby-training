# Merge Sort 

def Merge(arr,low,mid,high)
  left = low
  right = mid+1
  temp = []

  while(left<=mid && right <= high)
    if(arr[left] <= arr[right])
      temp<<arr[left]
      left += 1
    else
      temp<<arr[right]
      right +=1
    end
  end

  while(left<=mid)
    temp<<arr[left]
    left += 1
  end

  while(right <= high)
    temp<<arr[right]
    right +=1
  end

  for i in low..high
    arr[i] = temp[i - low] 
  end
end

def divide(arr,low,high)
  return if low >= high

  mid = (low + high) / 2
  divide(arr,low,mid)
  divide(arr,mid+1,high)
  Merge(arr,low,mid,high)
   
  arr.inspect
end

puts "Enter the elements of Array"
arr = gets.chomp.split(' ').map(&:to_i)
puts divide(arr,0,arr.length-1)
