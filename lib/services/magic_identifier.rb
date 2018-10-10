# frozen_string_literal: true

require 'prime'

module Services
  class MagicIdentifier
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def call
      sqrt_exists? &&
        sqrt.to_int.prime?
    end

    private

    def sqrt
      @sqrt ||= Math.sqrt(number)
    end

    def sqrt_exists?
      sqrt.denominator == 1
    end
  end
end
