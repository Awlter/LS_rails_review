def set_current_user(user=nil)
  session[:user_id] = (user || create(:user)).id
end