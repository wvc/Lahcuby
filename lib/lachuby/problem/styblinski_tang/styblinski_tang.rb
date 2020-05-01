
module Lachuby
  module Problem
    class StyblinskiTang

      def evaluate(x_values)
        value = 0.0
        x_values.each do |x_i|
          value += (x_i**4 - 16 * x_i**2 + 5 * x_i) / 2
        end
        value
      end

    end
  end
end