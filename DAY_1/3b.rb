#Write a oct to hex converter

def oct_to_hex(num)
    decimal = num.to_i(8)
    hex_value = decimal.to_s(16)
    puts hex_value
end

oct_to_hex("32")