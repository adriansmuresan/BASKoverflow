get '/users/new' do

erb :"users/new"

end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/login' do
  @failed_user = params[:error]
erb :"users/login"
end

post '/users/login' do
  if user = User.find_by(params[:email])
    if user.authenticate?(params[:email], params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      @errors = user.errors.full_messages
      erb :"users/login"
    end
  else
    redirect '/users/login?error=notfound'
  end
end

get '/users/logout' do
  session.clear
  redirect '/questions?logout=success'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end

