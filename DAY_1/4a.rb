#  a) Check if a string is a palindrome

def palindrome str
    right = str.length - 1
    left = 0 

    while (right > left)
        return false if str[right] != str[left]
        right -= right
        left += left
    end
true
end

puts palindrome("palpyoranmge")