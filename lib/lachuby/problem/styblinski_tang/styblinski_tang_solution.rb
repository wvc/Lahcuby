require 'lachuby/problem/styblinski_tang/styblinski_tang'


module Lachuby
  module Problem
    class StyblinskiTangSolution

      @@styblinksiTang = Lachuby::Problem::StyblinskiTang.new

      def initialize(x_values = nil)
        @x_minimum = -5
        @x_maximum = 5
        @x_variation_scale = 0.2

        @x_values = x_values

        unless @x_values
          @x_values = get_random_x_values(10)
        end

        @cost = nil
      end

      def get_cost()
        unless @cost
          @cost = @@styblinksiTang.evaluate(@x_values)
        end
        @cost
      end

      def get_variation()
        new_x_values = @x_values.clone
        random_index = rand(@x_values.length)

        new_x_values[random_index] = get_random_x_value
        return StyblinskiTangSolution.new(new_x_values)

        random_change = (rand() - 0.5) * @x_variation_scale * 2
        new_value = new_x_values[random_index] + random_change
        while (new_value < @x_minimum) || (new_value > @x_maximum )
          random_change = (rand() - 0.5) * @x_variation_scale * 2
          new_value = new_x_values[random_index] + random_change
        end

        new_x_values[random_index] += new_value
        StyblinskiTangSolution.new(new_x_values)
      end

      def get_string_representation()
        get_cost.to_s + ' [' + @x_values.join(', ') + ']'
      end

      private

      def get_random_x_values(size)
        x_values = []
        size.times do |_|
          x_values.push(get_random_x_value)
        end
        x_values
      end

      def get_random_x_value
        amplitude = @x_maximum - @x_minimum
        rand() * amplitude + @x_minimum
      end

    end
  end
end