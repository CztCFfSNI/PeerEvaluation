json.extract! student, :id, :Fname, :Lname, :email, :created_at, :updated_at, :student_id, :team_id
json.url student_url(student, format: :json)
