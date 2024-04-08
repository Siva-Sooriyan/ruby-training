# Program to print all Substring

def sub_string(str)
    n = str.length
    (0...n).each do |i|
      (i...n).each do |j|
          string = str[i..j]
          puts string
      end
    end
  end
  

  puts "Enter a string"
  str = gets.chomp
  sub_string(str)
  