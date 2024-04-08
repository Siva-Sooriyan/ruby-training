# Write a hexa to octal converter

def hex_to_oct(num)
    decimal = num.hex
    octal_value = decimal.to_s(8)
    puts "The Ocatal value is #{octal_value}"
end 


puts "enter a number :" 
num = gets.chomp
hex_to_oct(num)
