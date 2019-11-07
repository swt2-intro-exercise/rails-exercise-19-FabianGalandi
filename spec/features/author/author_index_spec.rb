require 'rails_helper'

describe "index listing all authors" do
  it "should render without error" do
    visit authors_path
  end

  it "should have a table with the headings 'Name' and 'Homepage'" do
    visit authors_path
    within('tr') do
      expect(page).to have_content('Name')
      expect(page).to have_content('Homepage')
    end
  end

  it "should have a link to create a new author" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should have a link to delete an author" do
    visit authors_path
    # save current author count
    author_count_before = Author.count
    # just delete first author found
    find_link("Delete author").click
    # check if author count has decreased
    expect(Author.count).to be < author_count_before
  end

end