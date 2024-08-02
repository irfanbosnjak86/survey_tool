class Survey < ApplicationRecord
  validates_presence_of :title, :question
end
