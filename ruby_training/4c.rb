#  c) Remove all vowels from a string

def remove_vowels string
    vowels = ["a","e","i","o","u"]
    word = string.split('')
    after = word - vowels
    str = after.join()
    return str
end

puts remove_vowels("apple")
