get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"/questions/show"
end

post '/questions' do
  if logged_in?
    new_question = Question.new(params[:new_question])
    new_question.author_id = session[:user_id]
    if new_question.save
      redirect :"/questions/#{new_question.id}"
    else
      @errors = new_question.errors.full_messages
      erb :'/questions/index'
    end
  else
    @errors = ["Unauthorized Access"]
    erb :'/questions/index'
  end
end



post '/questions/:id/votes' do
if request.xhr?
  p "value================================================"
  question = Question.find(params[:id])
  new_val = request.params['value']
  vote = Vote.create(value: new_val, votable_id: question.id, votable_type: 'Question', voter_id: current_user.id)
  question.vote_total.to_s
else
  if params[:upvote]
    vote= Vote.create(value: 1, votable_id: params[:id], votable_type: 'Question', voter_id: current_user.id)
  else
    vote= Vote.create(value: -1, votable_id: params[:id], votable_type: 'Question', voter_id: current_user.id)
  end
    p back
    redirect back
end
end



