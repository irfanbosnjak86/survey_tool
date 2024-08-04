class CreateQuestions < ActiveRecord::Migration[7.1]
  def up
    create_table :questions do |t|
      t.string :text
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end

    Survey.all.each do |survey|
      Question.create!(text: survey.question, survey_id: survey.id)
    end

    remove_column :surveys, :question
  end

  def down
    add_column :surveys, :question, :string

    Question.all.each do |question|
      question.survey.update!(question: question.text)
    end

    drop_table :questions
  end
end
