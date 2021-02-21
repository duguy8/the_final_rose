require "rails_helper"

RSpec.describe "When I visit a bachelorette/contestants index" do
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
    @ski_trip = @man1.outings.create!(
      name: "Ski Trip",
      location: "Aspen, CO",
      date: "01/22/2021"
    )
    @hike = @man1.outings.create!(
      name: "Hike",
      location: "Flatirons, CO",
      date: "01/25/2021"
    )
    @dinner = @man1.outings.create!(
      name: "Snarfs",
      location: "S Broadway, CO",
      date: "01/27/2021"
    )
  end

  describe "I see the contestants name, age, hometown" do
    it "Also see a link to go to that contestants show page" do

      visit bachelorette_contestants_path(@bach1.id)

      expect(page).to have_content(@man1.name)
      expect(page).to have_content(@man1.age)
      expect(page).to have_content(@man1.hometown)

      within("#contestant-#{@man1.id}") do
        expect(page).to have_link("#{@man1.name}")
      end

      within("#contestant-#{@man1.id}") do
        click_link("#{@man1.name}")
      end

      expect(current_path).to eq(contestant_path(@man1.id))
    end
  end

  describe "I see the season number conestant was on with description" do
    it "See list of names of outings contestant has been on, link to outing show page" do

      visit contestant_path(@man1.id)

      expect(page).to have_content(@bach1.season_number)
      expect(page).to have_content("Oh no, this was the most dramatic season!")
      expect(page).to have_link(@ski_trip.name)
      expect(page).to have_link(@hike.name)
      expect(page).to have_link(@dinner.name)

      within("#outing-#{@dinner.id}") do
        click_link(@dinner.name)
      end

      expect(current_path).to eq(outing_path(@dinner.id))
    end
  end
end
