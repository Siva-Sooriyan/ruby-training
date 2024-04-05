#Write a program that will check if a given Integer is prime or not

def is_prime(n)
    return false if n <= 1
    
    (2..(n - 1)).each do |i|
      return false if n % i == 0
    end
    
    return true
end
  

  number = 11
  if is_prime(number)
    puts "#{number} is a prime number"
  else
    puts "#{number} is not a prime number"
  end
  