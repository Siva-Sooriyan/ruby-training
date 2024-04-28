# Program to print all Substring
class Substrings
  def self.print(str)
    validate_input(str)
    n = str.length
     (0...n).each do |i|
        (i...n).each do |j|
          string = str[i..j]
          STDOUT << "#{string}\n"
      end
    end
  end

  private 
  
  def self.validate_input(str)
    raise ArgumentError, "Invlaid string, Enter a valid string" unless str.match?(/[a-zA-Z]/)
  end
end
  
begin
  STDOUT << "Enter a string\n"
  str = STDIN.gets.chomp
  Substrings.print(str)
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end  