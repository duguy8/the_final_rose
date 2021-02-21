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

  describe "I see bachelorettes name, season number and season description" do
    it "Also see a link to 'bachelorettes/:id/contestants' see only her contestants" do

      visit bachelorette_path(@bach1.id)

      expect(page).to have_content(@bach1.name)
      expect(page).to have_content(@bach1.season_number)
      expect(page).to have_content("The Most Dramatic Season Yet!")

      visit bachelorette_contestants_path(@bach1.id)

      expect(page).to have_content(@man1.name)
      expect(page).to have_content(@man2.name)
      expect(page).to have_content(@man3.name)
    end
  end
end
