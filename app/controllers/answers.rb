post '/questions/:id/answers' do
  if logged_in?
    new_answer = Answer.new(description: params[:description])
    new_answer.answerer_id = session[:user_id]
    new_answer.question_id = params[:id]
    if new_answer.save
      redirect :"/questions/#{new_answer.question_id}"
    else
      @errors = new_answer.errors.full_messages
      erb :'/questions/index'
    end
  else
    @errors = ["Unauthorized Access"]
    erb :'/questions/index'
  end
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'/answers/edit'
end

put '/answers/:id' do
  if logged_in?
    answer = Answer.find(params[:id])
    update_answer = answer.update(description: params[:description])
    if update_answer
      redirect :"/questions/#{answer.question_id}"
    else
      @errors = ["Make sure you fill in all fields"]
      erb :'/questions/show'
    end
  else
    redirect :'/'
  end
end

post '/answers/:id/votes' do
if logged_in?
  old_vote = Vote.find_by(voter_id: current_user.id, votable_id: params[:id], votable_type: "Answer")
  answer = Answer.find(params[:id])

  if request.xhr?
    new_val = request.params['value']
    if old_vote && old_vote.value == new_val
    elsif old_vote
      old_vote.value = new_val
      old_vote.save
    else
    vote = Vote.create(value: new_val, votable_id: answer.id, votable_type: 'Answer', voter_id: current_user.id)
    end
    answer.vote_total.to_s
  else
    if params[:upvote]
      vote= Vote.create(value: 1, votable_id: params[:id], votable_type: 'Answer', voter_id: current_user.id)
    else
      vote= Vote.create(value: -1, votable_id: params[:id], votable_type: 'Answer', voter_id: current_user.id)
    end
      redirect back
  end
end
end

delete '/answers/:id' do
  Answer.find(params[:id]).destroy
  redirect back
end


