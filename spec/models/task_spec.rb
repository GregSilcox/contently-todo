# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  let(:list) { build :list, name: 'test_list' }
  let(:task) { build :task, list: list }

  context 'with no name' do
    let(:nameless_task) { build :task, list: list, name: nil }

    it { expect(nameless_task).to_not be_valid }
  end

  context 'on create' do
    context 'a completed task' do
      let(:complete_task) { build :task, list: list, completed: true }

      it { expect(complete_task).to_not be_valid }
    end

    context 'an incomplete task' do
      let(:incomplete_task) { build :task, list: list }
      it { expect(incomplete_task).to be_valid }
    end
  end

  context 'scopes' do
    before do
      task1 = create :task, list: list, name: 'done'
      task1.update completed: true
      create :task, list: list, name: 'started'
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
