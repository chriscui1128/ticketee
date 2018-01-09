require "rails_helper"

RSpec.feature "Users can create new tickets" do
  before do
  	project = FactoryBot.create(:project, name: 'Internet Explorer')

  	visit project_path(project)
  	click_link "New Ticket"
  end

  scenario "when providing valid attributes" do
  	fill_in "Name", with: "My first ticket"
  	fill_in "Description", with: "A ticket for Internet Explorer project"

  	click_button "Create Ticket"

  	expect(page).to have_content "Ticket has been created."
  end

  scenario "when providing invalid attributes" do
  	fill_in "Name", with: ""
  	fill_in "Description", with: ""
  	click_button "Create Ticket"
  	expect(page).to have_content "Ticket has not been created."
  	expect(page).to have_content "Name can't be blank"
  	expect(page).to have_content "Description can't be blank"
  end

  scenario "with an invalid description" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "Too Short"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Description is too short"
  end
end