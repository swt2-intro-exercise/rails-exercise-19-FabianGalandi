require 'rails_helper'

describe "Edit author page", type: :feature do

  before(:each) do
    @testAuthor = FactoryBot.create :author
  end

  it "should render withour error" do
    visit edit_author_path(@testAuthor)
  end

  it "should edit author" do
    visit edit_author_path(@testAuthor)
    page.fill_in 'author[first_name]', with: @testAuthor.first_name
    page.fill_in 'author[last_name]', with: @testAuthor.first_name
    page.fill_in 'author[homepage]', with: 'http://www.test.com'
    find('input[type="submit"]').click
    @alan.reload
    expect(@alan.homepage).to be 'http://www.test.com'
  end

end 