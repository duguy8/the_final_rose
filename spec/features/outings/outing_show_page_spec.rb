require "rails_helper"

RSpec.describe "When I visit an outings show page" do
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
    @man2.outings << @hike
    @man3.outings << @hike
  end

  describe "I see the outings name, location, date" do
    it "Shows total count of contestants for outing, list their names" do

      visit outing_path(@hike)

      expect(page).to have_content(@hike.name)
      expect(page).to have_content(@hike.location)
      expect(page).to have_content(@hike.date)
      expect(page).to have_content("Count of Contestants: 3")
      expect(page).to have_content("Contestants: #{@man1.name}, #{@man2.name}, #{@man3.name}")
    end
  end
end
