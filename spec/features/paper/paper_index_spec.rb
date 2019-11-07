require 'rails_helper'

describe "Paper index page", type: :feature do

  before(:each) do
    @test1 = Paper.create(:title => "How to Create a General AI",
                  :venue => "testVenue",
                  :year => 1950,
                  :authors => [])

    @test2 = Paper.create(:title => "How to defeat a General AI Killer Robot",
                  :venue => "testVenu",
                  :year => 1968,
                  :authors => [])
  end

  it "should render withour error" do
    visit papers_path
  end

  it "should show allow filtering papers by year" do
    visit papers_path

    expect(page).to have_text(@test1.title)
    expect(page).to have_text(@test2.title)

    visit papers_path(:year => 1950)

    expect(page).to have_text(@test1.title)
    expect(page).to_not have_text(@test2.title)

    visit papers_path(:year => 1968)

    expect(page).to_not have_text(@test1.title)
    expect(page).to have_text(@test2.title)
  end

end 
end