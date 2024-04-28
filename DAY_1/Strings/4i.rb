#longest common subsequence
class Longestcommonsubsequence
  def self.lcs(x,y)
    validate_input(x,y)
    m = x.length
    n = y.length

    lcs_length = Array.new(m+1) {Array.new(n+1,0)}

    (1..m).each do |i|
      (1..n).each do |j|
        if x[i - 1] == y[j - 1]
          lcs_length[i][j] = lcs_length[i -1][j -1] + 1
        else
          lcs_length[i][j] = [lcs_length[i][j-1],lcs_length[i-1][j]].max
        end
      end
    end
    lcs_length[m][n]
  end

  private

  def self.validate_input(x,y)
    raise ArgumentError, "Invalid String A, enter a valid string" unless x.match?(/^[a-zA-Z]+$/)
    raise ArgumentError, "Invalid String B, enter a valid string" unless y.match?(/^[a-zA-Z]+$/)
  end
end

begin
  STDOUT << "Enter a string A\n"
  x = STDIN.gets.chomp
  STDOUT << "Enter a string B\n"
  y = STDIN.gets.chomp
  result = Longestcommonsubsequence.lcs(x,y)
  STDOUT << "LCS of String #{x} and #{y} are #{result}\n"
rescue ArgumentError => e 
  STDERR << "#{e.message}\n"
rescue => e
  STDERR << "An error occured: #{e.message}\n"
end
