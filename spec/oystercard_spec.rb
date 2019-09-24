# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'can touch in' do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in
      expect(card).to be_in_journey
    end

  it 'raises message when balance is below 1' do
      message = "Insufficient funds to travel"
      expect { subject.touch_in }.to raise_error message
    end
  end

  it 'can touch out' do
    card = Oystercard.new
    card.touch_out
    expect(card).not_to be_in_journey
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it 'raise an error if maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error 'Maximum balance of £90 exceeded'
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'can deduct money from the balance' do
      expect { subject.deduct 1 }.to change { subject.balance }.by (-1)
    end
  end
end

  # describe '#touch_in' do
  #   it { is_expected.to respond_to :touch_in }
  #
  #   it 'is aware that it is in use' do
  #     expect { subject.touch_in }.to raise 'Journey in progress'
  #   end
  # end
