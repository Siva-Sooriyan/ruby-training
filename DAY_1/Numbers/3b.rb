#Write a octal to hexa converter
class OctToHexConverter

  def self.convert(num)
    validate_input(num)
    decimal = num.to_i(8)
    hex_value = decimal.to_s(16)
    return hex_value
  end

  private

  def self.validate_input(num)
    raise ArgumentError, "Invalid Octal number" unless num =~ /\A[0-7]+\z/
  end
end

begin
  STDOUT << "Enter a octal number to convert to Hexadecimal\n"
  num = STDIN.gets.chomp
  result = OctToHexConverter.convert(num)
  STDOUT << "Hexadecimal equivalent of Octal #{num} is #{result}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end
