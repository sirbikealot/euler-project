# euler_project_problem_1.rb

=begin
Exercise 1 description:
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
=end

def sum_of_multiples(min,max)
  natural_set = (min...max).to_a
  multiples = natural_set.select { |n| (n % 3 == 0) or (n % 5 == 0) }
  sum = multiples.reduce(&:+)
  puts "Sum of natural numbers between #{min} and #{max} that are divisible by 3 or 5 is #{sum}"
  sum
end

# This is how I went about solving the puzzle:

=begin

Two ways to do this.  I'll call them inductive and reductive.  The inductive solution starts with 1, increments until 1000 and along the way prints the number if it meets the divmod3 and divmod5 conditions.  Need to capture them in a set so we can get their sum.  This may or may not consume less resources than the reductive solution.  In the reductive solution, start with the set of natural numbers below 1000 in set, array or range form, whichever one consumes the fewest resources while giving us the adequate methods and is most readable.  Since Ruby has such powerful Array methods and Enumerators let's start with that:

natural_min = 1
natural_max = 1000
natural_set = (natural_min...natural_max).to_a # natural numbers below limit
multiples = natural_set.select { |n| (n % 3 == 0) and (n % 5 == 0) } # divisible by 3 and 5
sum = multiples.reduce(&:+)
puts "Sum of natural numbers between #{natural_min} and #{natural_max} that are divisible by 3 and 5 is #{sum}"



natural_min = 1
natural_max = 1000
natural_set = (natural_min...natural_max).to_a # natural numbers below limit
multiples = natural_set.select { |n| (n % 3 == 0) or (n % 5 == 0) } # divisible by 3 and 5
sum = multiples.reduce(&:+)
puts "Sum of natural numbers between #{natural_min} and #{natural_max} that are divisible by 3 or 5 is #{sum}"
# => 233168

natural_min = 1
natural_max = 10
natural_set = (natural_min...natural_max).to_a # natural numbers below limit
multiples = natural_set.select { |n| (n % 3 == 0) or (n % 5 == 0) } # divisible by 3 and 5
sum = multiples.reduce(&:+)
puts "Sum of natural numbers between #{natural_min} and #{natural_max} that are divisible by 3 or 5 is #{sum}"
# => 23
# => real	0m0.033s
# => user	0m0.025s
# => sys	0m0.006s

Seems to work.  Final step is to make it into a method that we can test with MiniTest:

=end

