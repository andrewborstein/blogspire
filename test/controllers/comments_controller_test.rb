require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = User.create!(name: 'Andrew', email: 'email@email.com', password: 'test1234')
    @blog = Blog.create!(title: 'Andrew', body: 'Andrew', user: @user)

    @comment = Comment.create!(body: 'Andrew', user: @user, blog: @blog)

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { blog_id: @comment.blog_id, body: @comment.body, user_id: @comment.user_id }
    end

    assert_redirected_to blog_path(assigns(:comment).blog)

    # assert flash message
    # assert presence of comment body
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    patch :update, id: @comment, comment: { blog_id: @comment.blog_id, body: @comment.body, user_id: @comment.user_id }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end
end
