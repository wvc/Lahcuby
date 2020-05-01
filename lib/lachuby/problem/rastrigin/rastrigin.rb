# http://en.wikipedia.org/wiki/Rastrigin_function
module Lachuby
  module Problem
    class Rastrigin

      def evaluate(x_values)
        a = get_a
        value = a * x_values.length
        x_values.each do |x_i|
          value += x_i**2 - a * Math::cos(2 * x_i * Math::PI)
        end
        value
      end

      protected

      def get_a()
        10
      end

    end
  end
end
