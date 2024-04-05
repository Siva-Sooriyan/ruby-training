#Frequency of each character in alphabetical order 

def Frequency str
    ordered_word = Hash.new(0)
    str.downcase.each_char do |char|
        ordered_word[char] += 1 if char.match?(/[a-z]/)
    end
    ordered_word.sort.inspect
end

puts "Enter a alphabetical word"
str = gets.chomp
puts Frequency(str)