#  c) Remove all vowels from a string
class Remove_vowels
  def self.removal(string)
    validate_input(string)
    vowels = ["a","e","i","o","u"]
    word = string.split('')
    after = word - vowels
    str = after.join()
    return str
  end

  private
  def self.validate_input(string)
    raise ArgumentError, "Invalid string, Enter a valid string" unless string.match?(/^[a-zA-Z]+$/)
  end
end

begin
  STDOUT << "Enter a string\n"
  string = STDIN.gets.chomp
  result = Remove_vowels.removal(string)
  STDOUT << "The string #{string} after removal of all vowels is #{result}\n"
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end
