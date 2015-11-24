require 'spec_helper'

feature "a user's profile page can be visited" do
  given(:alice) { create(:user) }

  background do
    create(:review, reviewer: alice)
    sign_in
  end

  scenario "clicking a user's name leads to their profile page" do
    visit home_path
    click_link alice.full_name
    expect_to_see_profile_of alice
  end

  def expect_to_see_profile_of(user)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.power_animal)
  end
end

