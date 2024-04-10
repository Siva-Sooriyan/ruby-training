# Write a hexa to octal converter
class HexToOctConverter

  def self.convert(num)
    validate_input(num)
    decimal = num.hex
    octal_value = decimal.to_s(8)
    return octal_value
  end

  private 

  def self.validate_input(num)
    raise ArgumentError, "Invalid hexadecimal number" unless num =~ /\A[0-9A-Fa-f]+\z/
  end
end

begin
  STDOUT << "Enter a hexadecimal number to convert to octal\n"
  num = STDIN.gets.chomp
  result = HexToOctConverter.convert(num)
  STDOUT << "Octal equivalent of  hexadecimal #{num} is #{result}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e 
  STDERR << "An error occured: #{e.message}\n"
end
