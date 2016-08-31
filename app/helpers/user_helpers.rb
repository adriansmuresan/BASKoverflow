helpers do

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @cached_user ||= User.find(session[:user_id])
  end

end
