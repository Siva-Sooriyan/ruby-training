#  Number of substrings that are divisible by 6 
class Substrings
  def self.divisible(str)
    validate_input(str)
    count = 0
    (0...str.length).each do |i|
      num = 0
      (i...str.length).each do |j|
        num = num * 10 + str[j].to_i
        count += 1 if num % 6 == 0
      end
    end
    count
  end

  private 

  def self.validate_input(str)
    raise ArgumentError, "Invalid Number,Enhter a valid number" unless str.match?(/^\d+$/)
  end
  
end


begin
  STDOUT << "Enter a number\n"
  str = STDIN.gets.chomp
  result = Substrings.divisible(str)
  STDOUT << "Number of Substrings divisible by 6 are #{result}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end