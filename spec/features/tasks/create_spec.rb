# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples'

feature 'Creating a task' do
  let!(:list) { create :list }

  scenario 'redirects to the tasks index page on success' do
    visit tasks_path
    click_on 'Add a task'
    expect(page).to have_content('Create a task')

    fill_in 'Name', with: 'Test my app'
    select 'MyString'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app')
  end

  include_examples 'save task with blank name', '/tasks/new'
  
  scenario 'does not display the completed checkbox' do
    visit new_task_path

    expect(page).to_not have_content('Completed')
  end
end
