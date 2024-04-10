# All Subsequences
class Subsequences
  def self.calculating_subsequence(str)
    validate_input(str)
    n = str.length
    total = 2**n
    for i in 0...total
      temp = ""
      for j in 0...n
        if (i & (1 << j)) != 0
          temp += str[j]
        end
      end
      # Print subsequence
      puts temp unless temp.empty?
    end
  end
  
   private 

  def self.validate_input(str)
    raise ArgumentError, "Invalid input,Please enter only alphabetic characters" unless str.match?(/^[a-zA-Z]+$/)
  end
end

begin
  STDOUT << "Enter a String\n"
  str = STDIN.gets.chomp
  STDOUT << "All subsequences of the string '#{str}' are\n"
  Subsequences.calculating_subsequence(str)
rescue ArgumentError => e
  STDERR << "#{e.message}\n"
rescue => e
    puts "An error occurred: #{e.message}\n"
end
  