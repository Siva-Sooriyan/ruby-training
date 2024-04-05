# Program to print all Substring

def sub_string(str)
    n = str.length
    (0...n).each do |start|
      (start...n).each do |end_point|
        (start..end_point).each do |index|
          print str[index]
        end
        puts 
      end
    end
  end
  

  puts "Enter a string"
  str = gets.chomp
  sub_string(str)
  