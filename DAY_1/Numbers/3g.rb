# Compute n! mod p 

def modFact (n,p)
    return 0  if n >= p

    result = 1
    (1..n).each do |i|
        result = (result * i) % p
    end
    return result
end

begin 
  puts "Enter a non-negative number "
  n = gets.chomp.to_i
  puts "Enter a prime number"
  p = gets.chomp.to_i

  raise ArgumentError, "Invalid number , Enter a valid non-negative number" unless n.is_a?(Integer) && n >= 0
  raise ArgumentError, "Invalid number , Enter a valid prime number" unless p.is_a?(Integer) && p > 0

  result = modFact(n,p)
  puts "#{n}! % #{p} = #{result}"
rescue ArgumentError => e
  puts "Error: #{e.message}"
rescue => e
  puts "An error occured: #{e.message}"
end