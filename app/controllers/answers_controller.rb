class AnswersController < ApplicationController
    before_action :set_question
    
    def create  
      @answer = @question.answers.build(answer_params)
      @answer.user_id = current_user.id
    
      if @answer.save
        flash[:success] = "You answered the hell out of that question!"
        redirect_to :back
      else
        flash[:alert] = "Check the answers form, something went horribly wrong."
        render root_path
      end
    end
    
    def destroy  
      @answer = @question.answers.find(params[:id])
    
      @answer.destroy
      flash[:success] = "You killed your answer :("
      redirect_to root_path
    end  
    
    private
    
    def answer_params  
      params.require(:answer).permit(:content)
    end
    
    def set_question
      @question = Question.find(params[:question_id])
    end 
end

