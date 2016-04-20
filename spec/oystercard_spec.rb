require 'oystercard'

describe OysterCard do

  it 'has a balance of 0 when initialized' do
      expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up) }

  it 'update balance to 80' do
  	subject.top_up(80)
  	expect(subject.balance).to eq 80
  end

  it 'raise error if balance is over 90' do
    expect{subject.top_up(95)}.to raise_error "Cannot add more than #{OysterCard::LIMIT}"
  end

  it { is_expected.to respond_to(:deduct) }

  it 'deducts fare from balance' do
  	subject.top_up(90)
  	expect(subject.deduct(6)).to eq 84
  end

end