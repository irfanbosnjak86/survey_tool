class Survey < ApplicationRecord
  has_many :survey_answers

  validates_presence_of :title, :question
end
