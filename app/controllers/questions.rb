get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"/questions/show"
end




post '/questions/:id/votes' do

if params[:upvote]
  vote= Vote.create(value: 1, votable_id: params[:id], votable_type: 'Question', voter_id: current_user.id)
else
  vote= Vote.create(value: -1, votable_id: params[:id], votable_type: 'Question', voter_id: current_user.id)
end
  redirect back
end



