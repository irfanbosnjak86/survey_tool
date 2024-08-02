require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  class Validation < ActiveSupport::TestCase
    test "should not save survey without title" do
      survey = Survey.new(question: "test question?")

      assert_not survey.save
    end

    test "should not save survey without question" do
      survey = Survey.new(title: "test title")

      assert_not survey.save
    end

    test "should save survey with valid attributes" do
      survey = Survey.new(title: "test title", question: "test question?")

      assert survey.save
    end
  end
end
