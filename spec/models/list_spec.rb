require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#name' do
    let(:list) { create :list, name: 'Home Tasks' }

    it { expect(list.name).to eq 'Home Tasks' }
  end
end
