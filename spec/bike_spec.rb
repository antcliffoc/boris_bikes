require './lib/bike'

describe Bike do

  it { should respond_to ("working?") }
  it { should respond_to ("report") }

  context "broken bike" do
    it "is not working" do
      subject.report
      expect(subject.working?).to eq(false)
    end
  end

  context "working bike" do
    it "is working" do
      expect(subject.working?).to eq(true)
    end
  end



end
