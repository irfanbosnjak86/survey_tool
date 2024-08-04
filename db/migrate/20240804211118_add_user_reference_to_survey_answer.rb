class AddUserReferenceToSurveyAnswer < ActiveRecord::Migration[7.1]
  def change
    add_reference :survey_answers, :user, index: true
  end
end
