class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end
   
    def new
        @question = Question.new
    end
    
    def create
        que = params[:question][:que]
        user = User.find_by(uname: session[:uname])
        answer1 = params[:question][:answer1]
        answer2 = params[:question][:answer2]
        answer3 = params[:question][:answer3]
        answer4 = params[:question][:answer4]
        @question = Question.new(que: que, user_id: user.id, answer1: answer1, answer2: answer2, answer3: answer3, answer4: answer4)
        if @question.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def destroy
        question = Question.find(params[:id])
        question.destroy
        redirect_to root_path
    end
end
