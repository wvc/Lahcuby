module Lahcuby
  class Solver

    def initialize(initial_solution, maximum_number_of_iterations, memory_size)
      @current_solution = initial_solution
      @maximum_number_of_iterations = maximum_number_of_iterations
      @memory_size = memory_size
    end

    def solve()
      costs_memory = []
      @memory_size.times do |_|
        costs_memory.push(@current_solution.get_cost)
      end
      best_solution = @current_solution

      @maximum_number_of_iterations.times do |iteration|
        memory_index = iteration % @memory_size
        new_solution = @current_solution.get_variation

        beats_current_solution =
            new_solution.get_cost <= @current_solution.get_cost
        memory_cost = costs_memory[memory_index]
        beats_memory_cost = new_solution.get_cost < memory_cost

        if beats_current_solution || beats_memory_cost
          @current_solution = new_solution
        end

        if beats_memory_cost
          costs_memory[memory_index] = new_solution.get_cost
        end

        if @current_solution.get_cost < best_solution.get_cost
          best_solution = @current_solution
        end
      end

      best_solution
    end

  end
end
