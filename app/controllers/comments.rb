post '/questions/:id/comments' do
  if logged_in?
    @comment = Comment.new({content: params[:content],commentable_id: params[:id], commentable_type: 'Question', commenter_id: session[:user_id]})
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
    @comment = Comment.new({content: params[:content],commentable_id: params[:answer_id], commentable_type: 'Answer', commenter_id: session[:user_id]})
    if @comment.save
      redirect back
    else
      @errors = @comment.errors.full_messages
      erb :"/questions/show"
    end
 end
end
