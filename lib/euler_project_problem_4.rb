# euler_project_problem_4.rb

=begin

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

=end

a_high	= b_high 	= 999
a_low		= b_low 	= 900
palindromes = Hash.new
a = b = a_high

while b >= b_low
	a = a_high # reset a loop
	while a >= a_low
		candidate = a * b
		palindromes["#{a} * #{b}"] = candidate if candidate.to_s == candidate.to_s.reverse	
		a -= 1
	end
	b -= 1
end

puts "Largest palindromic number that is product of two 3-digit numbers:"
puts palindromes.sort_by {|_, product| product}.last
# => 913 * 993
# => 906609

# This is how I went about solving the problem and writing the code:

=begin
Of the set of palindromes made from the product of two 3-digit numbers, the largest would have to be the product of two very large 3-digit numbers, so start from 999 and 999 then count down.  This would be faster than counting up.

We can get an idea of how far we have to count down by first getting the product 999*999 = 998001 so now we know we're working with at most a 6-digit product.  This seems obvious but let's not assume an arbitrary level of math knowledge for all every reader/coders who may be reading this. Our 3-digit answers will likely be nearly as large as this.

Let's call our two factors a and b.  To determing whether we should loop through all the a possibilities before decrementing b, let's find the possible lower boundaries we'll be looking at. The square of the smallest 3-digit number (100) is 10_000 so our sought-after palindrome must be > 10_000.  We might get to the answer faster if we looped a from 999 down to 900 before looping b down from 999.  Looping both down simultaneously may cause us to miss the largest palindromic result and get the wrong answer.

Convert from Integer to String and reverse to get palindrome and put first palindrome in each loop then decrement b.

b_high = 999
b_low = 900 # Started with lower limit of 900 but generated no results so kept stepping it down
a_high = 999
a_low = 900 # Started with lower limit of 900 but generated no results so kept stepping it down
array = []
while a_high >= a_low
	if (a_high * b_high).to_s == (a_high * b_high).to_s.reverse
		array.push(a_high * b_high)
		# b_low = a_high # If 900*999 yields a palindrome then we wouldn't try 900*998...or its reverse 998*900
		# b_high -=1 # ...much less 998*889
		while b_high >= b_low # && b_high >= a_low # ...but we would still want to try 901*998...
			if (a_high * b_high).to_s == (a_high * b_high).to_s.reverse
				array.push(a_high * b_high)
				# a_low += 1 #...so keep squeezing the boundaries
			else
				b_high -=1
			end
		end
	else
		a_high -=1
	end
end

p array
puts array.sort.last

Got no results (but at least didn't blow up :-)) so kept bumping a_low and b_low down until I got to 100.  Had to go back and reset the a loop and move the b-decrement loop into that.

b_high = 999
b_low = 100
a_high_start = 999
a_high = 999
a_low = 100
array = []
while b_high >= b_low
	while a_high >= a_low
		candidate = a_high * b_high
		puts candidate
		if (candidate).to_s == (candidate).to_s.reverse
			array.push(candidate)
			a_high -=1
			# b_high -= 1
			# a_high = 999
			# b_low = a_high # If 900*999 yields a palindrome then we wouldn't try 900*998...or its reverse 998*900
			# b_high -=1 # ...much less 998*889
		else
			a_high -=1
		end
	end
	a_high = a_high_start - 1
	while b_high >= b_low
		candidate = a_high * b_high
		puts candidate
		if (candidate).to_s == (candidate).to_s.reverse
			array.push(candidate)
			b_high -= 1
		# b_low = a_high # If 900*999 yields a palindrome then we wouldn't try 900*998...or its reverse 998*900
		# b_high -=1 # ...much less 998*889
		else
			b_high -=1
		end
	end
end

p array
puts array.sort.last

# This didn't blow up, but it didn't identify any palindromes.  Went back and simplified: complete a loop inside a complete b loop and printed out a and b for every iteration.

a_high	= b_high 	= 999
a_low		= b_low 	= 900
array = []
a = b = a_high

while b >= b_low
	a = a_high # reset a loop
	while a >= a_low
		candidate = a * b
		puts "a: #{a} , b: #{b} => a * b = #{candidate}"
		array << candidate if candidate.to_s == candidate.to_s.reverse
		a -= 1
	end
	b -= 1
end
puts array.sort.last => 906609

Last step was to modify this to identify the 3-digit pair that yielded the largest palindrome
=end


