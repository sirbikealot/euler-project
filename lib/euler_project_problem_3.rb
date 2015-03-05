# euler_project_problem_3.rb

=begin

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

=end

class PrimeFactorGenerator # cannot make it a child class of Integer explicity because Numerics don't have ::new method
	
	def initialize(num)
		@num = num
		@test_factor = 2
		@factor_product = 1 # Will multiply prime factors together until product is original number
	end

	def greatest_prime_factor(number = @num)
		until @factor_product == @num # Switching to factor_product test cut runtime down for large numbers
			if number % @test_factor == 0 # is it a factor?
				@factor_product *= @test_factor # product of all prime factors found so far
				number = number / @test_factor # Next iteration will seek prime factors of remaining quotient. Need this or blows up
			else
				@test_factor += 1 # Next iteration will test new factor
			end
		end
		@test_factor # last factor identified is largest prime factor
	end

	def to_s
		@num
	end
	
end

g = PrimeFactorGenerator.new(600851475143)
# g.greatest_prime_factor # => 6857

=begin

g = PrimeFactorGenerator.new(9)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 3

g = PrimeFactorGenerator.new(24)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 3

g = PrimeFactorGenerator.new(25)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 5

g = PrimeFactorGenerator.new(13195)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 29

g = PrimeFactorGenerator.new(9_488_708)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 4871 

g = PrimeFactorGenerator.new(99_703_787)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 49851893

g = PrimeFactorGenerator.new(609_793_787)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 838781 

g = PrimeFactorGenerator.new(7_659_703_357)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 9129563

g = PrimeFactorGenerator.new(9_909_408_237)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 1154539


g = PrimeFactorGenerator.new(21_909_070_303)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 21458443 Took about 10 seconds.  Still much better than earlier version without the @factor_product test

g = PrimeFactorGenerator.new(3 * 9_488_708)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" 
# => greatest prime factor of 28466124 is 4871


g = PrimeFactorGenerator.new(600851475143)
puts "greatest prime factor of #{g.to_s} is #{g.greatest_prime_factor}" # => 6857

=end
