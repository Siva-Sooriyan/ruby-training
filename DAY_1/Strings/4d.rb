# #Given an input string S and positive integer N, rotate the string S left N times
class Left_rotate
  def self.rotate(string,num)
    validate_input(string,num)
    word = ""
    string.length.times do |i|
      word += string[(i + num) % string.length]  
    end
    return word
  end

  private

  def self.validate_input(string,num)
    # raise ArgumentError, "Invalid string, Enter a valid string" unless string.match?(/[a-zA-Z]/)
    raise ArgumentError, "Invalid number, Enter a valid numnber" unless num.is_a?(Integer) && num.positive?
  end
end

begin
  STDOUT << "Enter a String\n"
  string = STDIN.gets.chomp
  raise ArgumentError, "Invalid string, Enter a valid string" unless string.match?(/[a-zA-Z]/)
  STDOUT << "Enter a postive integer\n"
  num = Integer(STDIN.gets.chomp)
  result = Left_rotate.rotate(string,num)
  STDOUT << "After left-rotating the string #{string} #{num} times #{result}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end

