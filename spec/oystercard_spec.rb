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

  describe '#deduct' do
    it 'deducts the fare from the card' do
      oystercard.top_up(OysterCard::MAX_LIMIT)
      expect{ oystercard.deduct 10 }.to change{ oystercard.balance }.by -10
    end

describe 'touch in' do
    it 'touches in' do
      oystercard.top_up(OysterCard::MAX_LIMIT)
      expect { oystercard.touch_in }.to change { oystercard.in_journey? }.to true
    end
    it 'refuses to touch in if balance is less than £1' do
      expect { oystercard.touch_in }.to raise_error 'Not enough money for journey'
    end
  end

    it 'touches out' do
      expect { subject.touch_out }.to change { subject.in_journey? }.to false
    end
  end



  # If your card is empty, you wouldn't get past the entry barrier on London
  # transport network. This is because when you try to touch in, it checks the
  # balance and refuses to touch in unless you have enough money for one journey.
  #
  # Let's implement this check. Assume that the minimum fare is £1 and raise an
  # exception unless the balance is at least £1 on touch in.

end
