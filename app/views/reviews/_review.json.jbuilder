json.extract! review, :id, :personalscore, :workscore, :comment, :created_at, :updated_at, :written_by_id, :written_for_id, :project_id
json.url review_url(review, format: :json)

