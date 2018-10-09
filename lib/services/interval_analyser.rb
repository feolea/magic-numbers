# frozen_string_literal: true

module Services
  class IntervalAnalyser
    attr_reader :interval, :service

    def initialize(interval:, service: Services::MagicIdentifier)
      @interval = interval.first..interval.last
      @service = service
    end

    def call
      interval.map(&call_service)
    end

    private

    def call_service
      lambda do |item|
        service.new(item).call
      end
    end
  end
end
