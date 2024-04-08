#Write a program to print the factorial of a given Integer

def factorial(n)
    if n == 0 || n == 1
        return 1
    else 
        return n * factorial(n -1)
    end
end

n = 3
answer = factorial(n)
puts "factorial of #{n} is #{answer}"