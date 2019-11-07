require 'rails_helper'

title = "Test"
venue = "testVenue"
year = 2019

describe Paper, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should have title, venue, and year" do
    paper = Paper.new()
    paper.title = title
    paper.venue = venue 
    paper.year = year
    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)
  end

  it "should not validate without title" do
    paper = Paper.new( :venue => venue, :year => year)
    expect(paper).to_not be_valid
  end

  it "should not validate without venue" do
    paper = Paper.new( :title => title, :year => year)
    expect(paper).to_not be_valid
  end
  it "should not validate without year" do
    paper = Paper.new( :title => title, :venue => venue)
    expect(paper).to_not be_valid
  end

  it "should only validate with numerical year" do
    paper = Paper.new( :title => title, :venue => venue, :year => title)
    expect(paper).to_not be_valid
  end

  it "should have and belong to many authors" do
    paper = Paper.new( :title => title, :venue => venue, :year => title)
    #it should have an empty list of authors
    expect(paper.authors.count).to eq(0)
  end
end