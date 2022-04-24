require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(name: "Project 1", desc: "Ruby on Rails Evaluation")
  end

  test "should be valid" do
    assert @project.valid?
    end

  test "project name should be present" do
    @project.name = ""
    assert_not @project.valid?
  end
  
  test "desc should be present" do
    @project.desc = ""
    assert_not @project.valid?
  end

  test "name should not be too long" do
    @project.name = "m" * 51
    assert_not @project.valid?
    end
  
  test "desc should not be too long" do
    @project.desc = "m" * 800
    assert_not @project.valid?
    end



end
