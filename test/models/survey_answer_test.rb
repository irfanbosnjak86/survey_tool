require "test_helper"

class SurveyAnswerTest < ActiveSupport::TestCase
  class Validation < ActiveSupport::TestCase
    setup do
      @survey = surveys(:one)
    end

    test "should not save survey answer without survey" do
      survey_answer = SurveyAnswer.new

      assert_not survey_answer.save
    end

    test "should save survey answer when survey present" do
      survey_answer = SurveyAnswer.new(survey: @survey)

      assert survey_answer.save
    end
  end
end
