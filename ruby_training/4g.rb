# All Subsequences

def subsequences(str)
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
  
  def get_user_input
    puts "Enter a string:"
    input = gets.chomp
    until input.match?(/^[a-zA-Z]+$/)
      puts "Invalid input. Please enter only alphabetic characters:"
      input = gets.chomp
    end
    return input
  end
  
  begin
    str = get_user_input
    puts "All subsequences of the string '#{str}' are:"
    subsequences(str)
  rescue => e
    puts "An error occurred: #{e.message}"
  end
  