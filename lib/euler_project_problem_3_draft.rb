# euler_project_problem_3_draft.rb

=begin

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?


def factorize(n, least_test_factor = 2, factors = [])
	unless least_test_factor >= n/2
		unless factors.include?(least_test_factor)
			if n % least_test_factor == 0
				factors.push(least_test_factor) # append least_test_factor to factors array
				factorize(n/least_test_factor) # attempt to factorize n/least_test_factor
			else
				least_test_factor += 1
				factorize(n) # attempt to factorize next least_test_factor
			end
		else
			least_test_factor += 1
			factorize(n) # attempt to factorize next least_test_factor
		end
	end
end
			
factorize(10) # try a small number to try it out
factors.sort.last # return largest factor

# => stack level too deep (SystemStackError) Need to wrap this in a class so I can pass around instance variables



# What about simple iteration instead of recursion?

factors = []
n = 20 # start with small number to try it
2.step(n/2) do |test_factor|
	factors.push(test_factor) if n % test_factor == 0
end

print factors # doesn't throw errors but they aren't prime.  What about working some of the if-else control-flow statements into the step iterator?


factors = []
n = 24
2.step(n/2) do |test_factor|
	factors.push(test_factor) unless n % test_factor != 0 || factors.any? {|factor| test_factor % factor == 0}
end

print factors # => [2,3]
puts

factors = []
n = 13195
2.step(n/2) do |test_factor|
	factors.push(test_factor) unless n % test_factor != 0 || factors.any? {|factor| test_factor % factor == 0}
end

print factors # => [5, 7, 13, 29]
puts
puts factors.sort.last # => 29

factors = []
n = 600851475143
2.step(n/2) do |test_factor|
	factors.push(test_factor) unless n % test_factor != 0 || factors.any? {|factor| test_factor % factor == 0}
end

puts factors.sort.last # => took too long.  Need a different way for very large numbers.

factors = []
n = 88_289_786
2.step(n/2) do |test_factor|
	factors.push(test_factor) unless n % test_factor != 0 || factors.any? {|factor| test_factor % factor == 0}
end

puts factors.sort.last # => 50683 but took nearly two seconds. Need a different way for numbers > 100_000_000

# Idea: reset test_factor to be product of all factors identified thus far => Doesn't work 

class PrimeFactorGenerator # cannot make it a child class of Integer explicity because Numerics don't have ::new method
	
	def initialize(num)
		@num = num
		@factors = []
		@test_factor = 2
	end
	
	def prime_factors(@number = num) # => formal argument cannot be an instance variable
		unless @test_factor >= @number/2
			unless @factors.include?(@test_factor)
				if @number % @test_factor == 0
					@factors.push(@test_factor) # test_factor to factors array
					prime_factors(@number / @test_factor) # attempt to factorize @number/@test_factor
				else
					@test_factor += 1
					prime_factors(@number / @test_factor) # attempt to factorize @number/@test_factor
				end
			else
				@test_factor += 1
				prime_factors(@number / @test_factor) # attempt to factorize @number/@test_factor
			end
		end
	end
	
	def greatest_prime_factor(@number = num) # => formal argument cannot be an instance variable
		prime_factors(@number).sort.last
	end

	def to_s
		@num
	end
	
end
		
f = PrimeFactorGenerator.new(24)
puts "prime factors of #{f.inspect} is #{f.prime_factors}"
puts "greatest prime factor of #{f.inspect} is #{f.greatest_prime_factor}"

# => formal argument cannot be an instance variable in prime_factors(@number = num) and greatest_prime_factor(@number = num)

class PrimeFactorGenerator # cannot make it a child class of Integer explicity because Numerics don't have ::new method
	
	def initialize(num)
		@num = num
		@factors = []
		@test_factor = 2
	end
	
	def prime_factors(number = @num) # => formal argument cannot be an instance variable
		until @test_factor >= number/2 # or @num/2 ???
			if @factors.include?(@test_factor) 
				@test_factor += 1 
			else
				if number % @test_factor == 0 # is it a factor?
					@factors.push(@test_factor)
					number = number / @test_factor
					#	prime_factors(number) removed: recursion unnecessary
				else
					@test_factor += 1
				end
			end
		end
		@factors
	end
	
	def greatest_prime_factor(number = @num) # => formal argument cannot be an instance variable
		prime_factors(number).sort.last
	end

	def to_s
		@num
	end
	
end
		
f = PrimeFactorGenerator.new(24)
puts "prime factors of #{f.to_s} are #{f.prime_factors.join(", ")}" # => 2,3,4 Loop increments so else statements must be working but still pushing multiples of pre-identified factors to array
# puts "greatest prime factor of #{f} is #{f.greatest_prime_factor}"

# => `greatest_prime_factor': undefined method `sort' for nil:NilClass (NoMethodError)

=end

class PrimeFactorGenerator # cannot make it a child class of Integer explicity because Numerics don't have ::new method
	
	def initialize(num)
		@num = num
		@factors = []
		@test_factor = 2
	end
	
=begin
	def prime_factors(number = @num)
		until @test_factor >= @num/2 # or number/2 ???
			if @factors.include?(@test_factor) # Removed this if statement in refactoring
				@test_factor += 1 
			else
				if number % @test_factor == 0 # is it a factor?
					@factors.push(@test_factor)
					number = number / @test_factor
				else
					@test_factor += 1
				end
			end
		end
		@factors
	end
=end

=begin	
	def prime_factors(number = @num)
			until @test_factor >= @num/2 # or number/2 ???
				if number % @test_factor == 0 # is it a factor?
					@factors.push(@test_factor)
					number = number / @test_factor
				else
					@test_factor += 1
				end
			end
		@factors
	end
	def greatest_prime_factor(number = @num)
		prime_factors.last # prime_factors.sort.last ???	
	end

	def to_s
		@num
	end
end

=end

=begin	

class PrimeFactorGenerator # cannot make it a child class of Integer explicity because Numerics don't have ::new method

	def initialize(num)
		@num = num
		# @factors = [] # Eliminated after eliminating call to array
		@test_factor = 2
		@factor_product = 1 # Used to test if factorization is complete
	end

=end

=begin
	# Refactored out prime_factors method after realized it doesn't matter if duplicate factors are in the result
	def prime_factors(number = @num)
		until @test_factor >= @num/2 # or number/2 ???
			if @factors.include?(@test_factor) # Removed this if statement in refactoring
				@test_factor += 1 
			else
				if number % @test_factor == 0 # is it a factor?
					@factors.push(@test_factor)
					number = number / @test_factor
				else
					@test_factor += 1
				end
			end
		end
		@factors
	end
=end

=begin
	def greatest_prime_factor(number = @num)
		until @test_factor >= @num/2 # Tried number/2 but didn't get to largest prime factor
			if number % @test_factor == 0 # is it a factor?
					@factors.push(@test_factor)
					number = number / @test_factor
			else
					@test_factor += 1
			end
		end
		@factors.last # => Why not eliminate the @factors array call since last factor is the one we want it should be the returned value of @test_factor anyway?  Tried this but it yielded the wrong number.
	end
=end

=begin
	def greatest_prime_factor(number = @num)
		until @test_factor >= @num/2 || @factor_product == @num # Adding factor_product test cut runtime down for large numbers
			if number % @test_factor == 0 # is it a factor?
					#@factors.push(@test_factor) # Eliminated after eliminating call to array
					@factor_product *= @test_factor
					number = number / @test_factor # Need this or blows up
			else
					@test_factor += 1
			end
		end
		@test_factor #  Eliminated the @factors array call since last factor is the one we want it should be the returned value of @test_factor anyway.
	end
	
	def to_s
		@num
	end
	
end

=end

=begin

g = PrimeFactorGenerator.new(24)
puts "prime factors of #{g.to_s} are #{g.prime_factors.join(", ")}" # => 2,2,2,3 Duplicates factors but don't care because it's cheaper than searching for duplicates.  Still get highest prime factor at end of array
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 3

p = PrimeFactorGenerator.new(13195)
puts "prime factors of #{p.to_s} are #{p.prime_factors.join(", ")}" # => 5, 7, 13, 29
puts "greatest prime factor of #{p.to_s} is #{p.greatest_prime_factor}" # => 29

=end
