def login(user = nil)
  user ||= create(:user)
  session[:user_id] = user.id 
end

def logout
  session[:user_id] = nil
end

def current_user
  User.find_by_id(session[:user_id])
end

def sign_in(user = nil)
  user ||= create(:user)
  visit sign_in_path
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign In'
end

