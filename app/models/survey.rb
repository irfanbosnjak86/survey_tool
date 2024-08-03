class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_answers

  validates_presence_of :title, :question
end
