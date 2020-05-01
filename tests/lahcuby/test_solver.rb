require 'test/unit'

require 'lahcuby/problem/rastrigin/rastrigin_solution'
require 'lahcuby/problem/styblinski_tang/styblinski_tang_solution'
require 'lahcuby/dummy_solver'
require 'lahcuby/solver'

class TestSolver < Test::Unit::TestCase

  @@initial_solution = Lahcuby::Problem::RastriginSolution.new
  @@maximum_number_of_iterations = 1000
  @@memory_size = 10

  def test_dummy_solver
    solver =
        Lahcuby::DummySolver.new(
            @@initial_solution, @@maximum_number_of_iterations)
    best_solution = solver.solve

    puts 'DummySolver result: '
    puts best_solution.get_string_representation

    assert_true best_solution.get_cost < @@initial_solution.get_cost
  end

  def test_solver
    solver =
        Lahcuby::Solver.new(
            @@initial_solution, @@maximum_number_of_iterations, @@memory_size)
    best_solution = solver.solve

    puts 'Solver result: '
    puts best_solution.get_string_representation

    assert_true best_solution.get_cost < @@initial_solution.get_cost

  end

end