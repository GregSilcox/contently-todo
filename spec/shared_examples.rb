RSpec.shared_examples 'save task with blank name' do |path|
  scenario 'displays an error when no name is provided' do
    visit path
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
end

