require 'rails_helper'

describe "Edit paper page", type: :feature do

  before(:each) do
    @testAuthor = FactoryBot.create :author
    @testPaper = FactoryBot.create :paper
  end

  it "should render without error" do
    visit edit_paper_path(@testPaper)
  end

  it "should allow to select authors from select box" do
    visit edit_paper_path(@testPaper)
    expect(@testPaper.authors.count).to eq(1)
    page.unselect @testAuthor.name, from: 'paper[author_ids][]', match: :first
    find('input[type="submit"]').click
    @testPaper.reload
    expect(@testPaper.authors.count).to eq(1)
  end

end 