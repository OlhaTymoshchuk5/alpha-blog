require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "olhatym", email: "olha@gmailc.om",
                              password: "password", admin: true)
    sign_in_as(@admin_user)    
  end

  test "get new category form and create category" do
    #get new categories path
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "Sports"}}
      assert_response :redirect
    end
    #helper method to follow the redirect
    follow_redirect!
    #that is was successful
    assert_response :success
    assert_match "Sports", response.body
  end


  test "get new category form and reject invalid category submition" do
    #get new categories path
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "}}
    end
    assert_match "errors", response.body
    #assertions
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
