require 'oystercard'

  describe Oystercard do
    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end
end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up }.to change{ subject.balance }.by 1 
    end
end

# it 'adds money to card' do
#   card = Card.new
#   expect(subject).to respond_to (:add_money)
# end

  # it 'checks card balance' do
  #   oystercard = Oystercard.new
  #   expect(subject).to respond_to(:balance)
  # end
