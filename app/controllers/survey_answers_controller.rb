class SurveyAnswersController < ApplicationController
  before_action :set_survey_answer, only: %i[ show edit update destroy ]
  before_action :set_survey

  # GET /survey_answers or /survey_answers.json
  def index
    @survey_answers = SurveyAnswer.where(survey_id: @survey.id)
  end

  # GET surveys/1/survey_answers/1
  def show
  end

  # GET surveys/1/survey_answers/new
  def new
    @survey_answer = SurveyAnswer.new(survey: @survey)
  end

  # GET /survey_answers/1/edit
  def edit
  end

  # POST surveys/1/survey_answers
  def create
    @survey_answer        = SurveyAnswer.new(survey_answer_params)
    @survey_answer.survey = @survey
    @survey_answer.user   = current_user

    if @survey_answer.save
      redirect_to survey_survey_answers_url(@survey), notice: "Survey answer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT surveys/1/survey_answers/1
  def update
    @survey_answer.user = current_user

    if @survey_answer.update(survey_answer_params)
      redirect_to survey_survey_answers_url(@survey), notice: "Survey answer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE surveys/1/survey_answers/1
  def destroy
    @survey_answer.destroy!

    redirect_to survey_survey_answers_url(@survey), notice: "Survey answer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_answer
      @survey_answer = SurveyAnswer.find(params[:id])
    end

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    # Only allow a list of trusted parameters through.
    def survey_answer_params
      params.require(:survey_answer).permit(:answer, :survey_id)
    end
end
