require 'oystercard'

describe Oystercard do
  subject (:card){ described_class.new }
  let (:entry_station){ double :entry_station, zone: 1}
  let (:exit_station){ double :exit_station, zone: 2}
  let (:journey_log) { double :journey_log, start: nil }

  describe "#initialize" do
    it "initilizes with a balance of 0" do
      expect(card.balance).to eq 0
    end
  end

  describe "#top_up" do
    context "topping up" do
      it "allows people to increase balance by amount topped up" do
        expect{ card.top_up 10 }.to change{ card.balance }.by 10
      end
    end

    context "maximum limits" do
      it "enforces a maximum limit constant on card" do
        expect{ card.top_up (Oystercard::MAX_LIMIT + 1) }.to raise_error "Max limit of #{Oystercard::MAX_LIMIT} reached"
      end
    end
  end

  describe "#touch_in" do
    context "no money on card" do
      it "raises the correct error when balance is insufficient to pay for one journey" do
        expect{ card.touch_in(entry_station) }.to raise_error "Balance is less than #{Oystercard::MIN_FARE}"
      end
    end
    context "money on card" do
      it 'calls journey_log.start' do
        card.top_up Oystercard::MIN_FARE
        expect(card.journey_log).to receive(:start).with(entry_station)
        card.touch_in(entry_station)
      end
    end
  end

  describe "#touch_out" do
    context "touch out changes balance" do
      it "reduces money by Oystercard's minimum fare when you touch out" do
        card.top_up Oystercard::MIN_FARE
        card.touch_in(entry_station) #(entry_station)
        expect{ card.touch_out (exit_station) }.to change { card.balance }.by -(Oystercard::MIN_FARE * (entry_station.zone - exit_station.zone).abs+1)
      end
    end
  end

end
