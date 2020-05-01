module Lachuby
  class DummySolver

    def initialize(initial_solution, maximum_number_of_iterations)
      @current_solution = initial_solution
      @maximum_number_of_iterations = maximum_number_of_iterations
    end

    def solve()
      @maximum_number_of_iterations.times do |_|
        new_solution = @current_solution.get_variation
        if new_solution.get_cost < @current_solution.get_cost
          @current_solution = new_solution
        end
      end

      @current_solution
    end

  end
end