require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  should "show home page" do
    get home_path
    assert_response :success
    assert_select "div#breadcrumbs" do
      assert_select "[href=?]", /\/home\?bci=0/, title: "Home"
    end
  end
end

