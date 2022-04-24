require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(name: "Team 1")
  end
  
  test "should be valid" do
    assert @team.valid?
  end

  test "name should be present" do
    @team.name = ""
    assert_not @team.valid?
  end

  test "name should not be too long" do
    @team.name = "m" * 51
    assert_not @team.valid?
    end



end
