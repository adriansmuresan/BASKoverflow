get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"/questions/show"
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



