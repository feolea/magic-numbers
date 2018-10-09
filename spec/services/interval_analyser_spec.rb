# frozen_string_literal: true

RSpec.describe Services::IntervalAnalyser do
  describe '#execute' do
    context 'when a service is supplied' do
      it 'instanciate the service with each number of the given interval' do
        interval = [1, 4]
        service = double('Anything')
        service_obj = double('Anything', call: true)

        analyser = described_class.new(interval: interval, service: service)

        (1..4).each do |number|
          expect(service)
            .to receive(:new)
            .with(number)
            .and_return(service_obj)
        end
        analyser.call
      end

      it 'calls the method call on service' do
        interval = [2, 3]
        service = double('Anything')
        service_obj = double('Anything', call: true)

        allow(service).to receive(:new).and_return(service_obj)

        analyser = described_class.new(interval: interval, service: service)
        analyser.call

        expect(service_obj).to have_received(:call).twice
      end

      it 'returns a list with result of service call for each item' do
        interval = [1, 5]
        service = double('Anything')
        service_obj = double('Anything', call: 'Sky')

        allow(service).to receive(:new).and_return(service_obj)
        analyser = described_class.new(interval: interval, service: service)

        expect(analyser.call).to eq(%w[Sky Sky Sky Sky Sky])
      end
    end

    context 'without a service' do
      it 'uses the magic identifier service' do
        interval = [8, 10]

        analyser = described_class.new(interval: interval)

        expect(analyser.call).to eq([false, true, false])
      end
    end
  end
end
