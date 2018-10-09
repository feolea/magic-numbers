# frozen_string_literal: true

RSpec.describe Services::MagicIdentifier do
  describe '#call' do
    context 'with number with square root' do
      context 'and the root is prime' do
        it 'returns true' do
          number = 9

          service = described_class.new(number)

          expect(service.call).to be true
        end
      end

      context 'and the root is not prime' do
        it 'returns false' do
          number = 36

          service = described_class.new(number)

          expect(service.call).to be false
        end
      end
    end

    context 'without a square root' do
      it 'returns false' do
        number = 7

        service = described_class.new(number)

        expect(service.call).to be false
      end
    end
  end
end
