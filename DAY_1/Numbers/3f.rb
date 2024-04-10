#Write a program to print the factorial of a given Integer
class Factorial
  def self.find_factorial(n)
    if n < 0
      validate_input(n)
    end
    if n == 0 || n == 1
      return 1
    else 
      return n * find_factorial(n -1)
    end
  end
  
  private
  
  def self.validate_input(n)
    raise ArgumentError, "Input must be a non-negative integer"
  end
end


begin
  STDOUT << "Enter a non-negative integer to find its factorial\n"
  n = Integer(STDIN.gets.chomp)
  answer = Factorial.find_factorial(n)
  STDOUT << "Factorial of #{n} is #{answer}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occurred: #{e.message}\n"
end