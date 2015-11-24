require 'spec_helper'

feature 'create a new farm and review it' do
  scenario 'user can create and review a farm' do
    sign_in

    create_a_new_farm
    expect_farm_to_be_created

    create_a_review
    expect_review_to_be_created
    expect_to_receive_a_creation_message

    visit reviews_path
    expect_to_see_new_review
  end

  def expect_to_see_new_review
    expect(page).to have_content('Nice Farm')
  end

  def create_a_new_farm
    click_link 'Add new Farm'
    fill_in 'farm[name]', with: 'Monkey Farm'
    fill_in 'farm[street]', with: 'Sesame Street'
    fill_in 'farm[zip_code]', with: '123'
    fill_in 'farm[city]', with: 'Sim City'
    fill_in 'farm[country]', with: 'Noway'
    click_button 'Add this Farm'
  end

  def expect_farm_to_be_created
    expect(Farm.count).to eq(1)
  end

  def create_a_review
    choose('review_rating_4')
    fill_in 'review[body]', with: 'Nice Farm'
    click_button 'Create Review'
  end

  def expect_review_to_be_created
    expect(Review.count).to eq(1)
  end

  def expect_to_receive_a_creation_message
    expect(page).to have_content 'Thank you for reviewing'
  end
end

