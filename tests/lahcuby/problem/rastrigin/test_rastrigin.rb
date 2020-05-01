require 'test/unit'

require 'lahcuby/problem/rastrigin/rastrigin'

class TestRastrigin < Test::Unit::TestCase

  def test_rastrigin
    rastrigin = Lahcuby::Problem::Rastrigin.new
    minimum_value = rastrigin.evaluate([0, 0])
    assert_equal(0, minimum_value)

    random_x_1 = get_x_value
    random_x_2 = get_x_value
    random_x_3 = get_x_value

    assert_true random_x_1 - 5.12 <= 0
    assert_true random_x_2 + 5.12 >= 0
    assert_true random_x_3 - 5.12 <= 0
    random_x = [random_x_1, random_x_2, random_x_3]
    random_rastrigin = rastrigin.evaluate(random_x)
    assert_true random_rastrigin > minimum_value
  end

  def get_x_value
    maximum_x_value = 5.12
    minimum_x_value = -5.12
    amplitude = maximum_x_value - minimum_x_value
    rand() * amplitude + minimum_x_value
  end

end