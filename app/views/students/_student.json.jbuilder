json.extract! student, :id, :Fname, :Lname, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
