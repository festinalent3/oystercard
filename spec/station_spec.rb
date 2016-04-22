require 'station'

describe Station do
  subject (:station){ described_class.new "testname", "testzone"}

  context "initialize" do
    it "initalizes with name" do
      expect(station.name).to eq "testname"
    end
    it "initalizes with zone" do
      expect(station.zone).to eq "testzone"
    end
  end

end
