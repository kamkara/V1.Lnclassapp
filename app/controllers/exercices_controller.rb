class ExercicesController < ApplicationController
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
    @exercice = Exercice.new
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices or /exercices.json
  def create
    @exercice = Exercice.new(exercice_params)

    respond_to do |format|
      if @exercice.save
        format.html { redirect_to @exercice, notice: "Exercice was successfully created." }
        format.json { render :show, status: :created, location: @exercice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
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
  def destroy
    @exercice.destroy
    respond_to do |format|
      format.html { redirect_to exercices_url, notice: "Exercice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercice_params
      params.require(:exercice).permit(:name, :slug, :published, :classroom_id, :user_id)
    end
end
