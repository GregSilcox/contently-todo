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
end
