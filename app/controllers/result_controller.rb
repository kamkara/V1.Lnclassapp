class ResultController < ApplicationController
  before_action :authenticate_user!

  def new
    #authorize Result, :new?
    @result = Exercice.find(params[:exercice_id]).build_result()
  end
    
  def create
    #authorize Result, :create?
    @result = Result.new(result_params.merge({user: current_user}))
    redirect_to classroom_path(@result.exrcice.classroom) and return if @result.save
    render :new
  end

  private

  def result_params
    params.require(:result).permit( :exercice_id, answered_questions_attributes: [ :answer_id, :question_id])
  end
end
