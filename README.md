[![Build Status](https://secure.travis-ci.org/frantzmiccoli/Lahcuby.png)](http://travis-ci.org/frantzmiccoli/Lahcuby)

This is an implementation of the Late Acceptance Hill Climbing algorithm in 
rUBY (Burke & Bykov 2016). The original paper can be found here: http://dx.doi.org/10.1016/j.ejor.2016.07.012

The code has mostly been written during a live programming session. https://www.youtube.com/watch?v=5uO-CfSJWng

Usage
===

Implement your version of a solution, 
here we look for the min of `f(x) = x ** 2` between [-5; 5]:

```ruby
require 'lahcuby/problem/solution'

class MySolution < Lahcuby::Problem::Solution

  def initialize(x_value = nil)
    @x_value = x_value 
    unless @x_value
      @x_value = (rand() - 0.5) * 10
    end
  end
  
  def get_cost
    @x_value ** 2 
  end
  
  def get_variation
    new_x_value = _get_neighboring_x_value
    unless (new_x_value < 5) && (new_x_value > -5)
      new_x_value = _get_neighboring_x_value
    end 
    
    MySolution.new new_x_value
  end 
  
  private
  
  def _get_neighboring_x_value
    @x_value + rand() - 0.5
  end 
end
```

Solve it

```ruby
require 'lahcuby/solver'

initial_solution = MySolution.new
maximum_iterations = 1000
memory_size = 10

solver = Lahcuby::Solver.new initial_solution, maximum_iterations, memory_size
optimized_solution = solver.solve

puts optimized_solution.get_cost

# optimized_solution.x_value should be about 0 
```
