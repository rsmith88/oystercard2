require "oystercard.rb"

describe OysterCard do

  it { expect(subject.balance).to eq 0 }

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "should top up balance by 5" do
    expect{subject.top_up(5)}.to change{subject.balance}.by 5
  end

  it "raise an error if maximum limit is exceeded" do
    max_balance = described_class::MAX_BALANCE
    expect{subject.top_up(max_balance + 1)}
    .to raise_error "Maximum limit (£#{max_balance}) exceeded"
  end

  it 'deducts from balance' do
    expect{subject.deduct(5)}.to change{subject.balance}.by -5
  end

  it 'newly created card in not in journey' do
    expect(subject).not_to be_in_journey
  end

  it "allows touch in to start a journey" do
    subject.top_up(5)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "allows touch out to end a journey" do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "raises if balance is below the minimum balance on touch in" do
    expect{subject.touch_in}.to raise_error "Not enough money on card"
  end

end
