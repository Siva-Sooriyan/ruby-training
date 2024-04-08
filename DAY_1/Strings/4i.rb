#longest common subsequence

def lcs(x,y)
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

puts "enter a string A "
x = gets.chomp
puts "enter a string B"
y = gets.chomp
result = lcs(x,y)
puts "LCS of String #{x} and #{y} are #{result}"
