require 'spec_helper'

feature 'sign up process' do
  scenario 'user can create a new account' do
    alice = create(:user)
    sign_in(alice)
    expect(page).to have_content(alice.full_name)
  end
end

