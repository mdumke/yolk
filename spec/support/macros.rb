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

