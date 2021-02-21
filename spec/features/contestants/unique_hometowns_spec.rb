require "rails_helper"

RSpec.describe "When I visit '/bachelorettes/:id/contestants'" do
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
    @man4 = @bach1.contestants.create!(
      name: "Man Bear Pig",
      age: 100,
      hometown: "Brosville"
    )
  end

  describe "I see a unique list of all hometowns contestants are from" do
    it "ex: 'These contestants are from these hometowns: Denver, Aurora, Miami'" do

      visit bachelorette_contestants_path(@bach1.id)

      expect(page).to have_content("These Contestants are from these hometowns: Brosville, Chicago, Miami")
    end
  end
end
