post '/question/:id/answers' do
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


