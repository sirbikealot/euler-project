# euler_project_problem_2.rb

=begin
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
=end



class FibonacciSeries

  def initialize(max)
    @max = max.to_i
    @set = []
    puts "Initializing a Fibonacci Series to #{@max}"
  end

  def sum # test method to track value of y at each iteration
    x,y = 1,2
    sum = x + y
    while y < @max
      x,y = y, x + y
      sum += y unless y > @max # otw loop will execute once more and make y > 100
      puts "x = #{x}; y = #{y}"
    end
    puts "Sum of Fibonacci numbers to #{@max} is #{sum}"
    sum
  end

  def sum_evens
  x , y = 1 , 2
  sum = 2
  while y < @max
    x,y = y, x + y
    sum += y if y < @max && y.even?
  end
  puts "Sum of even Fibonacci numbers to #{@max} is #{sum}"
  sum
  end

end
		
f_four_million = FibonacciSeries.new(4_000_000)
f_four_million.sum_evens
# => 4613732


