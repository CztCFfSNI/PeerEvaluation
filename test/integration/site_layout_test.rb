require "test_helper"
 
class SiteLayoutTest < ActionDispatch::IntegrationTest
 test "layout links" do
   assert_template 'static_pages/index'
   assert_select "a[href=?]", static_pages_path, count: 2
   assert_select "a[href=?]", user_session_path
   assert_select "a[href=?]", static_pages_path
   assert_select "a[href=?]", destroy_user_session_path
   assert_select "a[href=?]", edit_user_registration_path
 
 end
end
