#Write a program that will check if a given Integer is Prime or not
class PrimeOrNot
  def self.prime(n)
    validate_input(n)
    return false if n <= 1
    (2..(n - 1)).each do |i|
      return false if n % i == 0
    end
    return true
  end

  private

  def self.validate_input(n)
    raise ArgumentError, "Invalid number, provide a valid number"  unless n.positive?
  end
end

begin
  STDOUT << "Enter a non-negative number\n"
  number = Integer(STDIN.gets.chomp)
  if PrimeOrNot.prime(number)
    STDOUT << "#{number} is a prime number\n"
  else
    STDOUT << "#{number} is not a prime number\n"
  end
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end