class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end
   
    def new
        @question = Question.new
    end
    
    def create
        que = params[:question][:que]
        answer1 = params[:question][:answer1]
        answer2 = params[:question][:answer2]
        answer3 = params[:question][:answer3]
        answer4 = params[:question][:answer4]
        #user = User.find_by(uid: session[:login_uid])
        @question = Question.new(que: que, answer1: answer1, answer2: answer2, answer3: answer3, answer4: answer4)#, user_id: user.id)
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
