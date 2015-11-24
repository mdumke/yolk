require 'spec_helper'

feature 'sign up process' do
  scenario 'user login to their account' do
    alice = create(:user)
    sign_in(alice)
    expect(page).to have_content(alice.full_name)
  end

  scenario 'user can create a new account' do
    visit sign_up_path
    fill_in_sign_up_form
    click_button 'Sign Up'
    expect_user_to_be_created
  end

  def fill_in_sign_up_form
    fill_in 'user[first_name]', with: 'Egon'
    fill_in 'user[last_name]', with: 'der Schreckliche'
    fill_in 'user[power_animal]', with: 'Elch'
    fill_in 'user[email]', with: 'a@b.c'
    fill_in 'user[password]', with: '123'
  end

  def expect_user_to_be_created
    expect(User.count).to eq(1)
  end
end

