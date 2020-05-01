require 'test/unit'

require 'lachuby/problem/rastrigin/rastrigin_solution'
require 'lachuby/dummy_solver'
require 'lachuby/solver'

class TestSolver < Test::Unit::TestCase

  @@initial_solution = Lachuby::Problem::RastriginSolution.new
  @@maximum_number_of_iterations = 1000000
  @@memory_size = 10

  def test_dummy_solver
    solver =
        Lachuby::DummySolver.new(
            @@initial_solution, @@maximum_number_of_iterations)
    best_solution = solver.solve

    puts 'DummySolver result: '
    puts best_solution.get_string_representation

    assert_true best_solution.get_cost < @@initial_solution.get_cost
  end

  def test_solver
    solver =
        Lachuby::Solver.new(
            @@initial_solution, @@maximum_number_of_iterations, @@memory_size)
    best_solution = solver.solve

    puts 'Solver result: '
    puts best_solution.get_string_representation

    assert_true best_solution.get_cost < @@initial_solution.get_cost

  end

end