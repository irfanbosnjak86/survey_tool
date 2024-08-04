class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_answers
  has_one :question

  validates_presence_of :title
end
