#Frequency of each character in alphabetical order 
#input - aabbiwiwi
#output - {"s"=>"2","b"=>"2","w"=>"2","i"=>"2"}
class Frequency
  def self.calculate(str)
    validate_input(str)
    ordered_word = Hash.new(0)
    str.downcase.each_char do |char|
      ordered_word[char] += 1 if char.match?(/[a-z]/)
    end
    ordered_word.sort
  end

  private 

  def self.validate_input(str)
    raise ArgumentError, "Invalid input, enter a valid string" unless str.match?(/[a-zA-Z]/)
  end
end

begin
  STDOUT << "Enter a alphabetical word\n"
  str = STDIN.gets.chomp
  result = Frequency.calculate(str)
  STDOUT << "Frequency of each character in alaphabetical order #{result}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end