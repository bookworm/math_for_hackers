class Integer
  DIGITS = %w{0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z}   
  
  def toBase(base) 
    number = self   
    return "0" if number == 0
    raise ArgumentError, "base is invalid" unless base.between?(2, DIGITS.length)
    result = []
    while number > 0
      number, remainder = number.divmod(base) 
      result.unshift(DIGITS[remainder])
    end
    result.join("")
  end
end 

num = 354
puts num.toBase(2)