#Write a octal to hexa converter

def oct_to_hex(num)
  decimal = num.to_i(8)
  hex_value = decimal.to_s(16)
  return hex_value
end

begin
  puts "Enter a octal number to convert to Hexadecimal"
  num = gets.chomp

  raise ArgumentError, "Invalid Octal number " unless num =~ /\A[0-7]+\z/

  hex_value = oct_to_hex(num)
  puts "Hexadecimal equivalent of Octal #{num} is #{hex_value}"

rescue ArgumentError => e
  puts e.message
rescue => e
  puts "An error occured: #{e.message}"
end
