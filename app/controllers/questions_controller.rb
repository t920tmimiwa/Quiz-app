class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end
   
    def new
        @question = Question.new
    end
    
    def create
        que = params[:question][:que]
        user = User.find_by(uname: session[:login_uid])
        @question = Question.new(que: que , user_id: user)
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
