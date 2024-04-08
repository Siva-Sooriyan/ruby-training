#  d) Given an input string S and positive integer N, rotate the string S left N times

def left_rotate(string,num)
    word = ""
    string.length.times do |i|
        word += string[(i + num) % string.length]  
    end
    return word
end

puts "Enter a String"
string = gets.chomp
puts "Enter a postive integer"
num = gets.chomp.to_i
puts left_rotate(string,num)

