#Write a octal to hexa converter

def oct_to_hex(num)
  decimal = num.to_i(8)
  hex_value = decimal.to_s(16)
  puts "The Hexadecimal value is #{hex_value}"
end

puts "Enter a octal number"
num = gets.chomp
oct_to_hex(num)