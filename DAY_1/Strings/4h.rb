# Count distinct subsequences
class Distinctsubsequence
  def self.count_distinct_subsquences str
    validate_input(str)
    n = str.length
    dp = Array.new(n+1, 0)
    last_occurence = {}

    dp[0] = 1

    (1..n).each do |i|
      dp[i] = 2 * dp[i - 1]

      if last_occurence.key?(str[i-1])
        dp[i] -= dp[last_occurence[str[i-1]] - 1]
      end
      last_occurence[str[i - 1]] = i
    end
    return dp[n]
  end

  private

  def self.validate_input(str)
    raise ArgumentError, "Invlaid input, Enter a valid string" unless str.match?(/^[a-zA-Z]+$/)
  end
end

begin
  STDOUT << "Enter a String\n"
  str = STDIN.gets.chomp
  result = Distinctsubsequence.count_distinct_subsquences(str)
  STDOUT << "Total Disntict subsequence of the given strings is #{result}\n"
rescue ArgumentError => e 
  STDERR << "#{e.message}\n"
rescue => e 
  STDERR << "An error occured: #{e.message}\n"
end


