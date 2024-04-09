#Write a program that will check if a given Integer is Prime or not

def is_prime(n)
    return false if n <= 1
    
    (2..(n - 1)).each do |i|
      return false if n % i == 0
    end
    
    return true
end
  
begin
puts "Enter a non-negative number"
number = Integer(gets.chomp)

raise ArgumentError, "Invalid number, provide a valid number"  unless number.positive?
  if is_prime(number)
    puts "#{number} is a prime number"
  else
    puts "#{number} is not a prime number"
  end

rescue ArgumentError => e
  puts e.message
rescue => e
  puts "An error occured: #{e.message}"
end