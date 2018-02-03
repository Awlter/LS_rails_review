def set_current_user(user=nil)
  session[:user_id] = (user || create(:user)).id
end

def sign_in(user=nil)
  user = user || create(:user)
  visit root_path
  click_link "Sign In"
  fill_in "Email Address", with: user.email
  fill_in "Password", with: user.password
  click_button 'Sign In'
end