require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_url
    assert_response :success
  end

  test 'should display all posts' do
    3.times do |i|
      Post.create(title: "Post Number #{i}", body: "Body ##{i}", published_at: Time.now)
    end

    get admin_url

    rows = css_select('tr')
    assert_equal(4, rows.count)
  end

  test 'should display buttons for draft posts' do
    3.times do |i|
      Post.create(title: "Post Number #{i}", body: "Body ##{i}", published_at: Time.now)
    end

    2.times do |i|
      Post.create(title: "Draft Post Number #{i}", body: "Body ##{i}", published_at: nil)
    end

    get admin_url

    buttons = css_select('table .btn')
    assert_equal(2, buttons.count)
  end

  test 'should publish post when button clicked' do
    post = Post.create(title: 'Test Draft Post', body: 'Body', published_at: nil)

    post publish_post_path(post)

    assert_redirected_to admin_path

    post.reload
    assert(post.published?)
  end

end
