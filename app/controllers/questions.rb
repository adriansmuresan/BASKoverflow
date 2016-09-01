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
if logged_in?
  old_vote = Vote.find_by(voter_id: current_user.id, votable_id: params[:id], votable_type: "Question")
  question = Question.find(params[:id])

if request.xhr?
  new_val = request.params['value']
  if old_vote && old_vote.value == new_val
  elsif old_vote
    old_vote.value = new_val
    old_vote.save
  else
  vote = Vote.create(value: new_val, votable_id: question.id, votable_type: 'Question', voter_id: current_user.id)
  end
  question.vote_total.to_s
else
  if params[:upvote]
    vote= Vote.create(value: 1, votable_id: params[:id], votable_type: 'Question', voter_id: current_user.id)
  else
    vote= Vote.create(value: -1, votable_id: params[:id], votable_type: 'Question', voter_id: current_user.id)
  end
    redirect back
end
end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  if logged_in?
    update_question = Question.find(params[:id]).update_attributes(params[:edit_question])
    if update_question
      redirect :"/questions/#{params[:id]}"
    else
      @errors = ["Make sure you fill in all fields"]
      erb :'/questions/show'
    end
  else
    redirect :'/'
  end
end


delete '/questions/:id' do
     Question.find(params[:id]).destroy
     redirect '/'
end

