#Last digit of Nth fibonacci number

def fibonacci_last_digit(n)
    return n if n <= 1
  
    fib = [0, 1]
    (2..n).each do |i|
      fib[i] = (fib[i - 1] + fib[i - 2]) % 10
    end
  
    return last = fib[n]
  end
  
begin
  puts "Enter the value of n (a non-negative integer):"
  n = gets.chomp.to_i

  raise ArgumentError, "Invalid number" unless n.is_a?(Integer) && n > 0

  last = fibonacci_last_digit(n)
  puts "The last digit of the #{n}'th Fibonacci number is #{last}."
rescue ArgumentError => e
  puts e.message
rescue => e
  puts "An error occured: #{e.message}"
end
