class CreateSurveyAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_answers do |t|
      t.boolean :answer, default: true
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
