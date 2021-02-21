require "rails_helper"

RSpec.describe "When I visit '/bachelorettes/:id'" do
  before :each do
    @bach1 = Bachelorette.create!(
      name: "Amy",
      season_number: 10
    )
    @man1 = @bach1.contestants.create!(
      name: "Donald",
      age: 34,
      hometown: "Miami"
    )
    @man2 = @bach1.contestants.create!(
      name: "Guy Man Dude",
      age: 29,
      hometown: "Brosville"
    )
    @man3 = @bach1.contestants.create!(
      name: "Chad",
      age: 25,
      hometown: "Chicago"
    )
  end

  it "I see average age of all contestants for bachelorette" do

    visit bachelorette_path(@bach1.id)

    expect(page).to have_content("Average Age of Contestants: 29.3")
  end
end
