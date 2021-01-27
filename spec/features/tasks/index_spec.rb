# frozen_string_literal: true

require 'rails_helper'

feature 'Showing the task list' do
  let!(:task) { FactoryBot.create :task }

  scenario 'shows all three links' do
    visit tasks_path
    expect(page).to have_content('All')
  end
end
