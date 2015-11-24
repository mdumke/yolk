require 'spec_helper'

feature 'user can see a list of farms' do
  given!(:review1) { create(:review) }
  given!(:review2) { create(:review) }

  scenario 'visiting the farms index page' do
    sign_in
    visit home_path
    expect_to_see_farm(review1.farm)
    expect_to_see_farm(review2.farm)
  end

  def expect_to_see_farm(farm)
    expect(page).to have_content(farm.name)
    expect(page).to have_content(farm.name)
  end
end

