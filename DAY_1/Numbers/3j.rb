#Partition a number into two divisible parts
class Divisible_part

  def self.partition(string,a,b)
    validate_input(string,a,b)
    size = string.to_s.length
    for i in 0...size-1
      first_half = string[0..i]
      seconf_half = string[i+1..size]
        if (first_half.to_i % a == 0) && (seconf_half.to_i % b == 0)
          return "YES"
        end
     end
    return "NO"
  end

  private

  def self.validate_input(string, a, b)
    raise ArgumentError, "Invalid string,Enter a valid number" unless string.to_s.match?(/^\d+$/)
    raise ArgumentError, "Invalid number,Enter a valid First number" unless a.is_a?(Integer)
    raise ArgumentError, "Invalid number,Enter a Second number" unless b.is_a?(Integer)
  end
end


begin
  STDOUT << "Enter a string to partition\n"
  string = STDIN.gets.chomp
  raise ArgumentError, "Invalid string, Enter a valid number" unless string.match?(/^\d+$/)
  STDOUT << "Enter first number\n"
  a = Integer(STDIN.gets.chomp)
  STDOUT << "Enter second number\n"
  b = Integer(STDIN.gets.chomp)
  result = Divisible_part.partition(string,a,b)
  STDOUT << "#{result}, It is divisible\n"
rescue ArgumentError => e
    STDERR << "#{e.message}\n"
rescue => e
    STDERR << "An error occured: #{e.message}\n"
end