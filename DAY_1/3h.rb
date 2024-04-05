#Last digit of Nth fibonacci number

def fibonacci_last_digit(n)
    return n if n <= 1
  
    fib = [0, 1]
    (2..n).each do |i|
      fib[i] = (fib[i - 1] + fib[i - 2]) % 10
    end
  
    return fib[n]
  end
  
  def get_user_input
    puts "Enter the value of n (a non-negative integer):"
    input = gets.chomp
    until input.match?(/^\d+$/) && input.to_i >= 0
      puts "Invalid input. Please enter a non-negative integer:"
      input = gets.chomp
    end
    return input.to_i
  end
  
  begin
    n = get_user_input
    result = fibonacci_last_digit(n)
    puts "The last digit of the #{n}'th Fibonacci number is #{result}."
  rescue => e
    puts "An error occurred: #{e.message}"
  end
  