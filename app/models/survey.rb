class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_answers
  has_one :question, dependent: :destroy

  validates_presence_of :title

  accepts_nested_attributes_for :question
end
