# Write a hexa to octal converter

def hex_to_oct(num)
  decimal = num.hex
  octal_value = decimal.to_s(8)
  return octal_value
end 

begin
  puts "Enter a hexadecimal number to convert to octal:"
  num = gets.chomp 

  raise ArgumentError, "Invalid hexadecimal number" unless num =~ /\A[0-9A-Fa-f]+\z/

  octal_value = hex_to_oct(num)
  puts "Octal equivalent of  hexadecimal #{num} is #{octal_value}"
rescue ArgumentError => e
  puts e.message
rescue => e 
  puts "An error occured: #{e.message}"
end

