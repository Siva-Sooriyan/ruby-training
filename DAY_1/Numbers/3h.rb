#Last digit of Nth fibonacci number
class Fibonacci_last_number
  def self.last_digit(n)
    validate_input(n)
    return n if n <= 1
    fib = [0, 1]
    (2..n).each do |i|
      fib[i] = (fib[i - 1] + fib[i - 2]) % 10
    end
    return last = fib[n]
  end

  private
  
  def self.validate_input(n)
    raise ArgumentError, "Invalid number" unless n.is_a?(Integer) && n > 0
  end
end
  
begin
  STDOUT << "Enter the value of n (a non-negative integer)\n"
  n = Integer(STDIN.gets.chomp)
  last = Fibonacci_last_number.last_digit(n)
  STDOUT << "The last digit of the #{n}'th Fibonacci number is #{last}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end
