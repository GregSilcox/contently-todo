# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples'

feature 'Editing a task' do
  let(:list) { create :list }
  let!(:task) { create :task, list: list, name: 'Test my app' }


  scenario 'redirects to the tasks index page on success' do
    visit tasks_path
    click_on 'Edit'
    expect(page).to have_content('Editing task')

    fill_in 'Name', with: 'Test my app (updated)'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
  end

  include_examples 'save task with blank name', "/tasks/1/edit"

  scenario 'lets the user complete a task' do
    visit edit_task_path(task)
    check 'Completed'
    click_button 'Save'

    visit task_path(task)
    expect(page).to have_content('true')
  end
end
