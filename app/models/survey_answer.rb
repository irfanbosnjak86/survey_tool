class SurveyAnswer < ApplicationRecord
  # TODO: Split this into new table, answers where the question id will be tied to answer
  belongs_to :survey
end
