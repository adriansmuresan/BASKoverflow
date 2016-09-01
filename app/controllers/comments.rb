
post '/questions/:id/comments' do
  if logged_in?
    @comment = Comment.new({content: params[:content], commentable_id: params[:id], commentable_type: 'Question', commenter_id: session[:user_id]})
    if @comment.save
      redirect back
    else
      @errors = @comment.errors.full_messages
      erb :"/questions/show"
    end
 end
end

post '/answers/:answer_id/comments' do
  if logged_in?
    @comment = Comment.new({content: params[:content], commentable_id: params[:answer_id], commentable_type: 'Answer', commenter_id: session[:user_id]})
    if @comment.save
      redirect back
    else
      @errors = @comment.errors.full_messages
      erb :"/questions/show"
    end
  end
end

post '/comments/:id/votes' do
if logged_in?
  old_vote = Vote.find_by(voter_id: current_user.id, votable_id: params[:id], votable_type: "Comment")
  comment = Comment.find(params[:id])



  if request.xhr?
    new_val = request.params['value']
    if old_vote && old_vote.value == new_val
    elsif old_vote
      old_vote.value = new_val
      old_vote.save
    else
    vote = Vote.create(value: new_val, votable_id: comment.id, votable_type: 'Comment', voter_id: current_user.id)
    end
    comment.vote_total.to_s
  else
    if params[:upvote]
      vote= Vote.create(value: 1, votable_id: params[:id], votable_type: 'Comment', voter_id: current_user.id)
    else
      vote= Vote.create(value: -1, votable_id: params[:id], votable_type: 'Comment', voter_id: current_user.id)
    end
      redirect back
  end
end
end
