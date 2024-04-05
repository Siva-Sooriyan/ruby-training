#  b) Check if a sentence is a palindrome

def string_palindrome sentence
    sentence = sentence.downcase.gsub(/[^a-z0-9]/, '')
     palindrome(sentence)    
end
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

 sentence = " A man , A plan , A Canal , panama!"
puts string_palindrome(sentence)
