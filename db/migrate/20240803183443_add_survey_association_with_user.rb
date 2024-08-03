class AddSurveyAssociationWithUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :surveys, :user, index: true
  end
end
