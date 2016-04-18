require 'oystercard'

describe OysterCard do
  let(:oystercard){ described_class.new }

  it 'has initial balance' do
    expect(oystercard.balance).to eq(0)
  end

  describe '#top_up' do
    it 'tops up the balance' do
      expect{ oystercard.top_up OysterCard::MAX_LIMIT }.to change{ oystercard.balance }.by OysterCard::MAX_LIMIT
    end
    it 'raises and error if top up amount increase balance past £90' do
      expect{ oystercard.top_up (OysterCard::MAX_LIMIT + 1) }.to raise_error "Maximum limit exceeded by 1!"
    end
  end

  describe '#touch in' do
    it 'touches in' do
      oystercard.top_up(OysterCard::MAX_LIMIT)
      expect { oystercard.touch_in }.to change { oystercard.in_journey? }.to true
    end
    it 'refuses to touch in if balance is less than £1' do
      expect { oystercard.touch_in }.to raise_error 'Not enough money for journey'
    end
  end

  describe '#touch out' do
    it 'touches out' do
      expect { oystercard.touch_out }.to change { oystercard.in_journey? }.to false
    end
    it 'reduces balance by MIN_FARE' do
      expect{oystercard.touch_out}.to change {oystercard.balance}.by (- OysterCard::MIN_FARE)
    end
  end

end
