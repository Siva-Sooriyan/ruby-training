#Find Remainder without using modulo operator

def find_remainder(dividend,divisior)
   return (dividend - divisior * (dividend / divisior))
end

begin
  puts "Enter a number for dividend"
  dividend = gets.chomp.to_i
  puts "Enter a number of divisor"
  divisior = gets.chomp.to_i

  raise ArgumentError, "Invalid number" unless dividend.to_i && divisior.to_i

  remainder = find_remainder(dividend,divisior)
  puts "The remainder of #{dividend} divided by #{divisior} is #{remainder}"
rescue ArgumentError => e
   puts e.message
rescue => e
   puts "An error occured: #{e.message}"
end