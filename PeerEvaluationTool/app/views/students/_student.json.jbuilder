json.extract! student, :id, :Fname, :Lname, :email, :studentid, :created_at, :updated_at
json.url student_url(student, format: :json)
