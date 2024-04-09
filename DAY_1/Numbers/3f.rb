#Write a program to print the factorial of a given Integer

def factorial(n)
  if n < 0
    raise ArgumentError, "Input must be a non-negative integer"
  end
  if n == 0 || n == 1
    return 1
  else 
    return n * factorial(n -1)
  end
end

# Input with Error handling
begin
  puts "Enter a non-negative integer to find its factorial:"
  n = Integer(gets.chomp)
  answer = factorial(n)
  puts "Factorial of #{n} is #{answer}"
rescue ArgumentError => e
  puts e.message
rescue => e
  puts "An error occurred: #{e.message}"
end