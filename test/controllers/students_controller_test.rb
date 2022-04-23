require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :redirect
  end

  test "should get new" do
    get new_student_url
    assert_response :redirect
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { Fname: @student.Fname, Lname: @student.Lname, email: @student.email, id: @student.id }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :redirect
  end

  test "should update student" do
    patch student_url(@student)
    
    assert_response :redirect
  end

  # test "should destroy student" do
  #   assert_difference('Student.count', -1) do
  #     delete student_url(@student)
  #   end

  #   assert_redirected_to students_url
  # end
end
