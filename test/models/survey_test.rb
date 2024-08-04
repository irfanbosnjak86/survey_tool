require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  class Validation < ActiveSupport::TestCase
    setup do
      @user = users(:one)
    end

    test "should not save survey without title" do
      survey = Survey.new

      assert_not survey.save
    end

    test "should not save survey without question" do
      survey = Survey.new(title: "test title")

      assert_not survey.save
    end

    test "should not save survey without user" do
      survey = Survey.new(title: "test title")
      survey.build_question(text: "Test")

      assert_not survey.save
    end

    test "should save survey with valid attributes" do
      survey = Survey.new(title: "test title", user: @user)
      survey.build_question(text: "Test")

      assert survey.save
    end
  end
end
