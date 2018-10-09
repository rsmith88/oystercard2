require "oystercard.rb"

describe OysterCard do

  it { expect(subject.balance).to eq 0 }

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "should top up balance by 5" do
    expect{subject.top_up(5)}.to change{subject.balance}.by 5
  end

  it "raise an error if maximum limit is exceeded" do
    expect{subject.top_up(100)}.to raise_error "Maximum limit exceeded"
  end

end
