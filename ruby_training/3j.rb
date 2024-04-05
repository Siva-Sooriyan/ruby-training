def partition(string,a,b)
    size =  string.length
    for i in 0...size-1
        first_half = string[0..i]
        seconf_half = string[i+1..size]
        if (first_half.to_i % a == 0) && (seconf_half.to_i % b == 0)
            return "YES"
        end
    end
    return "NO"
end

puts "Enter a string to partition:"
string = gets.chomp
puts "Enter first number :"
a = gets.chomp.to_i

puts "Enter second number :"
b = gets.chomp.to_i

puts partition(string,a,b)
