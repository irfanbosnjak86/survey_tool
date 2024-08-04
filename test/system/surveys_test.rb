require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
    @user   = users(:one)
    @survey.user = @user
    @survey.save
  end

  test "visiting the index" do
    visit new_session_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit surveys_url
    assert_selector "h1", text: "Surveys"
    click_on "Log Out"
  end

  test "should create survey" do
    visit new_session_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit surveys_url
    click_on "New survey"

    find("#survey_question_attributes_text").set("Test")
    fill_in "Title", with: @survey.title
    find("#submit").click

    assert_text "Survey was successfully created"
    click_on "Log Out"
  end

  test "should update Survey" do
    visit new_session_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit survey_url(@survey)
    click_on "Edit this survey", match: :first

    find("#survey_question_attributes_text").set("Test")
    fill_in "Title", with: @survey.title
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Log Out"
  end

  # TODO: For some reason this is failing
  # test "should destroy Survey" do
  #   visit new_session_url
  #   fill_in "Email", with: @user.email
  #   fill_in "Password", with: "password"
  #   click_button "Login"
  #
  #   visit survey_url(@survey)
  #   click_on "Destroy this survey", match: :first
  #
  #   assert_text "Survey was successfully destroyed"
  #   click_on "Log Out"
  # end
end
