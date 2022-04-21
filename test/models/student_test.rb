require "test_helper"
 
class StudentTest < ActiveSupport::TestCase
 def setup
   @student = Student.new(Fname: "Student", Lname: "Good", email: "mohith@gmail.com")
 end
 
 test "should be valid" do
   assert @student.valid?
 end
 
 test "Fname should be present" do
   @student.Lname = ""
   assert_not @student.valid?
 end
 
 test "Lname should be present" do
   @student.Lname = ""
   assert_not @student.valid?
 end
 
 test "email should be present" do
   @student.email = ""
   assert_not @student.valid?
 end
 
 test "Lname should not be too long" do
   @student.Lname = "m" * 51
   assert_not @student.valid?
   end
 
 test "Fname should not be too long" do
   @student.Fname = "m" * 51
   assert_not @student.valid?
   end
 
 test "email should not be too long" do
   @student.email = "m" * 51
   assert_not @student.valid?
   end
 
 
end
