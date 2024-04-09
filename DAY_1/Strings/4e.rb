#Frequency of each character in alphabetical order 
#input - aabbiwiwi
#output - {"s"=>"2","b"=>"2","w"=>"2","i"=>"2"}

def Frequency str
  ordered_word = Hash.new(0)
  str.downcase.each_char do |char|
  ordered_word[char] += 1 if char.match?(/[a-z]/)
  end
  ordered_word
end

puts "Enter a alphabetical word"
str = gets.chomp
puts Frequency(str)