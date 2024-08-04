class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  def show
  end

  # GET /surveys/new
  def new
    @survey = current_user.surveys.new
    @survey.build_question
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  def create
    @survey = current_user.surveys.new(survey_params)

    if @survey.save
      redirect_to survey_url(@survey), notice: "Survey was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      redirect_to survey_url(@survey), notice: "Survey was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy!

    redirect_to surveys_url, notice: "Survey was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:title, question_attributes: [:id, :text])
    end
end
