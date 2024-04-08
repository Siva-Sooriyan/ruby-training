# Count distinct subsequences

def count_distinct_subsquences str
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


puts "Enter a String"
str = gets.chomp
puts count_distinct_subsquences(str)



