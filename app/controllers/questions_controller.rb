class QuestionsController < ApplicationController
    def index
        @questions = Question.all
        @questionall = Question.all.sample(4)
        qarray = []
        @questionall.each do |e|
            qarray.push(e.id)
        end
        session[:qarray] = qarray
        session[:start] = qarray[0]
        qarray.shift()
        session[:answer] = false
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
            redirect_to questions_show_path
        else
            render 'new'
        end
    end
    
    def quiz
        @question = Question.find(params[:id])
        #now = qarray[0]
        #session[:now] = now
    end
    
    def mark
        nowarray = session[:qarray]
        @nextid = nowarray.shift()
        @question = Question.find(params[:id])
        if @question.correct_answer == @question.choice
            @answer= "正解"
            session[:answer] = @answer
        else
            @answer = "不正解"
            session[:answer] = @answer
            #redirect_to "/questions/#{session[:now]}/quiz"
        end
    end
    
    def update
        question = Question.find(params[:id])
        choice = params[:question][:choice]
        question.update(choice: choice)
        redirect_to "/questions/#{question.id}/mark"
=begin
        if session[:fid] = session[:sid]
            redirect_to 
        end
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
