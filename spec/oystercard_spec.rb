require "oystercard.rb"

describe OysterCard do

  it { expect(subject.balance).to eq 0 }

  it { is_expected.to respond_to(:top_up).with(1).argument }

end
