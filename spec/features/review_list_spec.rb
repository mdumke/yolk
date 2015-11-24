require 'spec_helper'

feature 'user can see a list of reviews' do
  given!(:review1) { create(:review) }
  given!(:review2) { create(:review) }

  scenario 'visiting the reviews index page' do
    sign_in
    visit reviews_path
    expect_to_see_review(review1)
    expect_to_see_review(review2)
  end

  def expect_to_see_review(review)
    expect(page).to have_content(
      "#{review.reviewer.full_name} has reviewed #{review.farm.name}")
  end
end

