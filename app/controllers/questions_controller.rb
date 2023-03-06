class QuestionsController < ApplicationController
    def index
        @questionrandom = Question.all.sample(3)
        qarray = []
        choices_count = []
        @questionrandom.each do |e|
            qarray.push(e.id)
            choices_count.push(e.choices.count)
        end
        
        session[:qarray] = qarray
        #indexに代入する値
        @start_id = qarray[0]
        session[:answer] = false
        
        session[:choices_count] = choices_count
    end
   
    def new
        @question = Question.new
    end
    
    def create
        @question = Question.new(question_params)
        if @question.save
            redirect_to questions_show_path
        else
            render 'new'
        end
    end
    
    def quiz
        @question = Question.find(params[:id])
        @choices = @question.choices
        @question_number = Array.new(@choices.count){|i| i+1}
    end
    
    def mark
        nowarray = session[:qarray]
        nowarray.shift()
        @nextid = nowarray[0]
        @question = Question.find(params[:id])
        if ActiveRecord::Type::Boolean.new.cast(params[:choice_id])
            @answer= "正解"
            session[:answer] = @answer
        else
            @answer = "不正解"
            session[:answer] = @answer
        end
    end
    
    def update
        question = Question.find(params[:id])
        choice = params[:question][:choice]
        question.update(choice: choice)
        redirect_to "/questions/#{question.id}/mark"
    end
    
    def show
        @user = current_user.questions
        @cuchoices = current_user.choices
        @cuchoice = current_user.questions
        @cuchoice.each do |e|
            @c = e.choices.group(:correct_answer).count
        end
    end
    
    def destroy
        question = Question.find(params[:id])
        question.destroy
        redirect_to questions_show_path
    end
    
private

    def question_params
        params.require(:question).permit(
            :body,
            choices_attributes: [:body, :correct_answer, :_destroy, :id]
        ).merge(user_id: current_user.id)
    end
end