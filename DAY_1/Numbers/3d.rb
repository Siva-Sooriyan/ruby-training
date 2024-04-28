#Write a program that will check if a given Integer is a perfect number
class PerfectNUmber
  def self.perfect(n)
    validate_input(n)
    return false if n <= 1
    sum_of_divisors = 0
    (1..n/2).each do |i|
      sum_of_divisors += i if n % i == 0
    end
    return sum_of_divisors == n
  end

  private

  def self.validate_input(n)
    raise ArgumentError, "Invalid number\n" unless n.positive?
  end
end

begin
  STDOUT << "Enter a Number to check perfect number or not\n"
  number = Integer(STDIN.gets.chomp)
  if PerfectNUmber.perfect(number)
    STDOUT << "#{number} is a perfect number\n"
  else
    STDOUT << "#{number} is not a perfect number\n"
  end
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end