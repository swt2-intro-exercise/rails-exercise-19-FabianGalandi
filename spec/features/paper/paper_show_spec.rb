require 'rails_helper'

describe "Show paper page", type: :feature do

  before(:each) do
    @testAuthor = FactoryBot.create :author
    @paperTest = FactoryBot.create :paper
  end

  it "should render without error" do
    visit paper_path(@paperTest)
  end

  it "should show authors full name" do
    visit paper_path(@paperTest)

    expect(page).to have_text(@testAuthor.name)
  end

end 