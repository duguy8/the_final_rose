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
end
