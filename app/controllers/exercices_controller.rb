class ExercicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercice, only: %i[ show edit update destroy ]
  
  # GET /exercices or /exercices.json
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1 or /exercices/1.json
  def show
  end

  # GET /exercices/new
  def new
    @feed_course = Course.friendly.find(params[:course_id])#finder course_id
    @exercice = @feed_course.exercices.build()   
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices or /exercices.json
  def create
    @exercice = current_user.exercices.build(exercice_params)
    redirect_to new_exercice_question_path(@exercice) and return if @exercice.save
    render :new
  end

  def publish
    @exercice = Exercice.friendly.find(params[:id])
    redirect_to course_path(@exercice.course) and return if @exercice.update(published: true)
        
    flash.notice << [@exercice.errors.full_messages]
    redirect_back fallback_location: "/"
  end

  # PATCH/PUT /exercices/1 or /exercices/1.json
  def update
    respond_to do |format|
      if @exercice.update(exercice_params)
        format.html { redirect_to @exercice, notice: "Exercice was successfully updated." }
        format.json { render :show, status: :ok, location: @exercice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercices/1 or /exercices/1.json
  # DELETE /exercices/1 or /exercices/1.json
  def destroy
    @exercice.destroy
    redirect_to classroom_path(@exercice.classroom)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.friendly.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def exercice_params
      params.require(:exercice).permit(:name, :slug, :published, :course_id, :user_id)
    end
end
