# Compute n! under modulo p 
class ModFAct

  def self.modFact (n,p)
    validate_input(n,p)
    result = 1
    (1..n).each do |i|
      result = (result * i) % p
    end
    return result
  end

  private

  def self.validate_input(n,p)
    raise ArgumentError, "Invalid number , Enter a valid non-negative number(N)\n" unless n.is_a?(Integer) && n >= 0
    raise ArgumentError, "Invalid number , Enter a valid prime number(P)\n" unless p.is_a?(Integer) && p > 0
  end
end
begin 
  STDOUT << "Enter a non-negative number\n"
  n = Integer(STDIN.gets.chomp)
  STDOUT << "Enter a prime number\n"
  p = Integer(STDIN.gets.chomp)
  result = ModFAct.modFact(n,p)
  STDOUT << "#{n}! % #{p} = #{result}\n"
rescue ArgumentError => e
  STDERR << "Error: #{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end