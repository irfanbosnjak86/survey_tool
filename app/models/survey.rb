class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_answers, dependent: :destroy
  has_one :question, dependent: :destroy

  validates_presence_of :title

  accepts_nested_attributes_for :question

  def percentage_of_answers
    survey_answers_count ||= SurveyAnswer.joins(:survey)
                                         .select("survey_answers.answer AS answer", "COUNT(*) AS count",
                                                  "(SELECT COUNT(*) FROM survey_answers WHERE survey_answers.answer = true) AS yes_count")
                                         .where(survey_id: id)

    if survey_answers_count.any?
      (survey_answers_count.first.yes_count.to_f / survey_answers_count.first.count.to_f) * 100
    end
  end
end
