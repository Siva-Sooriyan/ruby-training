#  b) Check if a sentence is a palindrome

class Palindrome
  def self.string(sentence)
    validate_input(sentence)
    sentence = sentence.downcase.gsub(/[^a-z0-9]/, '')
    palindrome(sentence)    
  end
  def self.palindrome(str)
    right = str.length - 1
    left = 0 
    while (right > left)
      return false if str[right] != str[left]
      right -= 1
      left += 1
    end 
    true
  end

  private 

  def self.validate_input(sentence)
    raise ArgumentError, "Invalid input, Enter a valid sentence" if sentence.empty?
  end
end


begin 
   STDOUT << "Enter a sentence\n"
   sentence = STDIN.gets.chomp
   result = Palindrome.string(sentence)
   if result
    STDOUT << "#{sentence}, This sentence is palindrome\n"
   else
    STDOUT << "#{sentence}, This sentence is not palindrome\n"
   end
rescue ArgumentError => e
    STDERR << "#{e.message}\n"
rescue => e
    STDERR << "An error occured: #{e.message}\n"
end
