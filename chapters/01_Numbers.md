Numbers are conveniently broken up into a few basic categories.

# Integers     
  ## Natural numbers. Represented by an uppercase `N`
  ## The numbers we count with e.g 0,1,2,3,4
  

# Conceptualizing Numbers.

Its important to distinguish between a "number" and its representation. The number five can just as easily be quantified by using a pentagon as it can a decimal. {{:note}} Most of our number theory actually got its start as geometry.{{:/note}}

Once you understand this simple yet powerful fundamental aspect our number systems start to make perfect sense. One needs a consistent representations for numbers that scale easily. Bases are just a natural progression of solving a mathematical need. 
 
This fundamental concept can be clearly reflected in an example.

```ruby 
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
puts num.toBase(12)
```    
A number can be best thought of as an array. Each position is the number X base + next number.     
Take the number 354 and place it in an array.

```ruby  
  num = [3,5,4]
  base = 10  
  index = 0
  3 x (10 x num[index]) + num[index + 1]          
```   

i.e 354 is equal to `3 * 100 + 5 * 10 + 4 * 1`  

## Binary

### Counting  
                       
In base "2" "9" would be `10010` or `1 * 8 + 1`. Counting in binary works the same as counting in any base.            

When symbols are exhausted, the next-highest digit to the left is incremented, and so on. In binary, once we reach 1 we reset it to 0 and the increment the next digit to the left. Another way to think about this is pushing digits into something, once we run out of space the we've to expand to make room and everything shits to the left.

For example:

0 = 0
1 = 1
2 = 10
3 = 11
4 = 100
5 = 101
6 = 110
7 = 111
8 = 1000
9 = 1001
10 = 1010 
11 = 1011    

### Adding & subtracting                 

Adding in binary is magically easy. First off its important to remember that addition and subtraction are just forms of counting. This means that addition and subtraction in any base works fundamentally the same, when you run out of numbers from one column you carry or borrow from another respectively. Got it? Good.     

Now before we add lets remember that:
- `0+0 = 0`
- `1+0 = 1`
- `1+1 = 10`                    

Lets 5(10) + 6(10). First 5 is 101 and 6 is 110.

```
  101
+ 110  
  ----   
  1 + 0 = 1
  1 + 0 = 1
  1 + 1 = 10
  1011 
```     
    
Its really that simple.   

To subtract lets remember that:
- `0-0 = 0`
- `1-0 = 1`
- `1-1 = 0`      

```
  10101
-  1011
  -----
   1010
```         

You should notice something really awesome in that the borrowing always results in the same pattern i.e `10-1 = 1`. You can just essentially write the answer down. If only subtraction in base 10 was this easy.       

### Multiplication   

In principle multiplication is quite easy in that we just keep multiplying by 0 or 1 and then shifting and adding. Rather
simple on paper but when implemented in computers this fails miserably. Multiplying a 32bit number would take 32 additions,
ouch.
````    
     1100 (12 in binary)
   x 1100 
   ------
     0000   (1100 x 0)
    0000    (1100 x 0)
   1100     (1100 x 1)
+ 1100      (1100 x 1)
--------- 
 10010000  (144 in binary)      
````  

But the simplicity of the binary system quickly comes to the rescue & methods to cut down on the number of additions have
been worked out. I'm not going to cover these but I'll briefly mention that multiplying a binary number by 2 simply
requires shifting the bits. For example, 7 in binary is 111 and 14 is 1110.  

### Cool Shit with binary

Binary is inherently well suited not just for simple storage but for comparing numbers. Bit wise operators are one the coolest things you  will ever mess with.  

## Hexadecimal

Bases inherently have properties associated with that base, that make that base useful in certain situations.
You can easily determine if a number in base 10 is divisible by 2 or 5. Base 12 comes with the same magical multiple properties; 2, 3, 4, and 6. Its important to note that time & angles are both base systems. Base 60 & base 360, respectively.  

{{:rant}}
There is a tendency by non programmers to think of binary numbers as a literal number system, like counting items with notches. Its not, its a base system. Its frightening how often I encounter this horribly uneducated concept.  

How can we claim to be teaching math, when people can get through school without ever actually understanding what a number is?       
{{/:rant}}      


# Mental math

# Logarithms  

# Fractions 

Fractions are nothing more than parts of number and as such are really just decimals. 

```
1
-
2 
```

is equivalent to 0.5. How many times does 2 go into 1? 0.5 times. What the above can be taken to mean is simply 1 divided by 2. Now you know why diagonal lines are often used to represent fractions.

Now you might be wondering why we don't simply use decimals. Well the reason is simple, fractions are typically easier to work with. And when decimals are easier to work with we use them instead. For instance, monies are written in decimal e.g "$2.45". 

To quote the wiki gods: 

`A decimal fraction is a fraction whose denominator is not given explicitly, but is understood to be an integer power of ten.`

{{:note}}    
What is easier for the majority is not necessarily easier for everyone. Some of maths are confusing & frankly odd. Its the reason why we've groups that for instance, advocate moving to a base 12 system. I personally find fractions intuitive but they're often presented in an unintuitive manner by people that don't conceptualize them very well. Its one of those ironies in the math world that the majority often finds things difficult that minority doesn't and thus everyone is left seriously confused.
{{:/note}}           

So whats going with our fractions? When we start to realize the inherit relationship of decimals, fractions & division some interesting facets become instantly clear. When we divide by 1/2 we a halving that number, multiply by 1/2.

```
1
-
2 
```

