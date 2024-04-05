#Write a program that will check if a given Integer is a perfect number

def is_perfect_number(n)
    return false if n <= 1
  
    sum_of_divisors = 0
    (1..n/2).each do |i|
      sum_of_divisors += i if n % i == 0
    end
  
    return sum_of_divisors == n
end
  
  number = 1
  if is_perfect_number(number)
    puts "#{number} is a perfect number"
  else
    puts "#{number} is not a perfect number"
  end