#  a) Check if a string is a palindrome
class Palindrome
  def self.check str
    validate_input(str)
    right = str.length - 1
    left = 0 
    while (right > left)
        return false if str[right] != str[left]
        right -= right
        left += left
    end
    true
  end

  private

  def self.validate_input(str)
    raise ArgumentError, "Invalid input,Enter valid string" unless str.is_a?(String) && !str.empty?
  end
end

begin 
   STDOUT << "Enter a string\n"
   str = STDIN.gets.chomp
   result = Palindrome.check(str)
   if result
    STDOUT << "#{str} is a palindrome\n"
   else 
    STDOUT << "#{str} is not a palindrome\n"
   end
rescue ArgumentError => e
    STDERR << "#{e.message}\n"
rescue => e
    STDERR << "An error occured: #{e.message}\n"
end
