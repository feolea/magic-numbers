# frozen_string_literal: true

module Services
  class MagicCounter
    attr_reader :list, :service

    def initialize(list:, service: Services::IntervalAnalyser)
      @list = list
      @service = service
    end

    def call
      list
        .map(&call_service)
        .flatten
        .select { |i| i }
        .count
    end

    private

    def call_service
      lambda do |interval|
        service
          .new(interval: interval)
          .call
      end
    end
  end
end
