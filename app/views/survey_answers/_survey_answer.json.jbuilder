json.extract! survey_answer, :id, :answer, :survey_id, :created_at, :updated_at
json.url survey_answer_url(survey_answer, format: :json)
