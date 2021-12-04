class ResultsController < ApplicationController
  before_action :authenticate_user!

  def new
    @result = Exercice.friendly.find(params[:exercice_id]).build_result()
  end
    
  def create
    @result = Result.new(results_params.merge({user: current_user}))
    redirect_to course_path(@result.exercice.course) and return if @result.save
    render :new
  end

  private

  def results_params
    params.require(:result).permit( :exercice_id, answered_questions_attributes: [:answer_id, :question_id])
  end
end