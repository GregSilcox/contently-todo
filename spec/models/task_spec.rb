# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  context 'with no name' do
    it 'is invalid' do
      task = Task.new
      expect(task).to_not be_valid
    end
  end

  context 'on create' do
    it 'is not valid when completed' do
      task = Task.new completed: true
      expect(task).to_not be_valid
    end
    
    it 'is valid when not completed' do
      task = Task.new completed: false
      expect(task).to_not be_valid
    end
  end

  context 'scopes' do
    before do
      FactoryBot.create :task, name: 'done', completed: true
      FactoryBot.create :task, name: 'started', completed: false
    end
    
    context 'for complete' do
      it { expect(Task.complete.count).to eq 1 }
      it { expect(Task.complete.first.name).to eq 'done' }
    end
    
    context 'for incomplete' do
      it { expect(Task.incomplete.count).to eq 1 }
      it { expect(Task.incomplete.first.name).to eq 'started' }
    end
  end
end
