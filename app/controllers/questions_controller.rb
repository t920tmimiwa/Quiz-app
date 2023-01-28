class QuestionsController < ApplicationController
    def index
        @questions = Question.all
        @users = User.all
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
        correct_answer = params[:question][:correct_answer]
        choice = params[:question][:choice]
        question = Question.new(que: que, user_id: user.id, answer1: answer1, answer2: answer2, answer3: answer3, answer4: answer4, correct_answer: correct_answer, choice: choice)
        if question.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def quiz
        @question = Question.find(params[:id])
=begin
        @questions = Question.all.sample(3)
        start = 0
        finish = @questions.count
        session[:start] = start
        session[:finish] = finish
        @questions.each do |e|
            @question_id = e.que
        end
=end
    end
    
    def mark
        quiz = Question.find(params[:id])
        if quiz.correct_answer == quiz.choice
            @answer= "正解"
        else
            @answer = "不正解"
        end
    end
    
    def update
        question = Question.find(params[:id])
        choice = params[:question][:choice]
        question.update(choice: choice)
        redirect_to "/questions/#{question.id}/mark"
=begin
        if session[:finish] <= session[:start]
            redirect_to 
        end
        redirect_to "/questions/#{@question.id}/mark"
=end
    end
    
    def show
        @questions = Question.all
        @user = User.find_by(uname: session[:uname])
    end
    
    def destroy
        question = Question.find(params[:id])
        question.destroy
        redirect_to questions_show_path
    end
end
