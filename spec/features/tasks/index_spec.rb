# frozen_string_literal: true

require 'rails_helper'

feature 'Showing the task list' do
  let!(:task) { FactoryBot.create :task }
  let!(:task) { FactoryBot.create :task }
  before do
    FactoryBot.create :task, name: 'task-incomplete', completed: false
    FactoryBot.create :task, name: 'task-complete', completed: true
  end

  scenario 'shows all three links' do
    visit tasks_path
    expect(page).to have_content('All')
    expect(page).to have_content('Incomplete')
    expect(page).to have_content('Complete')
  end

  scenario 'The default shows only incomplete tasks' do
    visit tasks_path
    expect(page).to have_content('task-incomplete')
    expect(page).to_not have_content('task-complete')
  end

  scenario 'All shows all tasks' do
    visit tasks_path
    click_on 'All'
    expect(page).to have_content('task-incomplete')
    expect(page).to have_content('task-complete')
  end

  scenario 'Complete shows only completed tasks' do
    visit tasks_path
    click_on 'Complete'
    expect(page).to_not have_content('task-incomplete')
    expect(page).to have_content('task-complete')
  end

  scenario 'Incomplete shows only incomplete tasks' do
    visit tasks_path
    click_on 'Incomplete'
    expect(page).to have_content('task-incomplete')
    expect(page).to_not have_content('task-complete')
  end
end
