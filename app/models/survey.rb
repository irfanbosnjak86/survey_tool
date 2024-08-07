class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_answers, dependent: :destroy
  has_one :question, dependent: :destroy

  validates_presence_of :title

  accepts_nested_attributes_for :question

  def percentage_of_answers
    survey_answers_count = survey_answers.where(survey_id: id)
                                         .select("survey_answers.answer AS answer",
                                                 "COUNT(*) AS number",
                                                 "(SELECT COUNT(*) FROM survey_answers WHERE survey_answers.answer = true
                                                 AND survey_answers.survey_id = #{id}) AS yes_count")


    if survey_answers_count.any?
      (survey_answers_count.first.yes_count.to_f / survey_answers_count.first.number.to_f) * 100
    end
  end
end
