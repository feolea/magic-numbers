# frozen_string_literal: true

RSpec.describe Services::MagicCounter do
  describe '#call' do
    context 'with magic numbers' do
      it 'counts magic numbers' do
        list = [[8, 27], [49, 49]]

        service = described_class.new(list: list)

        expect(service.call).to eq 3
      end
    end

    context 'without magic numbers' do
      it 'returns zero' do
        list = [[50, 57], [101, 109]]

        service = described_class.new(list: list)

        expect(service.call).to eq 0
      end
    end

    context 'with one interval only' do
      it 'counts magic numbers' do
        list = [[1, 49]]

        service = described_class.new(list: list)

        expect(service.call).to eq 4
      end
    end
  end
end
