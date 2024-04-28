#Find Remainder without using modulo operator
class Remainder
  def self.find_remainder(dividend,divisior)
   validate_input(dividend,divisior)
     return (dividend - divisior * (dividend / divisior))
  end

  private

  def self.validate_input(dividend,divisior)
   raise ArgumentError, "Invalid number\n" unless dividend.to_i && divisior.to_i
  end
end

begin
  STDOUT << "Enter a number for dividend\n"
  dividend = Integer(STDIN.gets.chomp)
  STDOUT << "Enter a number of divisor\n"
  divisior = Integer(STDIN.gets.chomp)
  remainder = Remainder.find_remainder(dividend,divisior)
  STDOUT << "The remainder of #{dividend} divided by #{divisior} is #{remainder}\n"
rescue ArgumentError => e
   STDERR << "#{e.message}\n"
rescue => e
   STDERR << "An error occured: #{e.message}\n"
end