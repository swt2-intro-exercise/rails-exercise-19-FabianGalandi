require 'rails_helper'

describe "New author page", type: :feature do
 
 it "should render withour error" do
   visit new_author_path
 end

 it "should have text inputs for an author's first name, last name, and homepage" do
  visit new_author_path
  # these are the standard names given to inputs by the form builder
  expect(page).to have_field('author[first_name]')
  expect(page).to have_field('author[last_name]')
  expect(page).to have_field('author[homepage]')
  end

  it "should show validation errors if last name is ommited" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Test'
    page.fill_in 'author[homepage]', with: 'https://www.test.com'
    find('input[type="submit"]').click
    expect(page).to have_text('Error while saving, no last name was submitted')
  end

end