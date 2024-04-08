#Find Remainder

def find_remainder(dividend,divisior)
   return (dividend - divisior * (dividend / divisior))
end

dividend = 26
divisior = 5
remainder = find_remainder(dividend,divisior)
puts "the remainder of #{dividend} divided by #{divisior} is #{remainder}"
