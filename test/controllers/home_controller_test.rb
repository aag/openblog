require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    Post.new(title: 'Test Post', body: 'Test Body', published_at: Time.now)

    get home_index_url
    assert_response :success
  end

  test 'should display published posts on the index page' do
    3.times do |i|
      Post.create(title: "Post Number #{i}", body: "Body ##{i}", published_at: Time.now)
    end

    get home_index_url

    posts = css_select('.post')
    assert_equal(3, posts.count)
  end

  test 'should display a maximum of 10 posts on the index page' do
    11.times do |i|
      Post.create(title: "Post Number #{i}", body: "Body ##{i}", published_at: Time.now)
    end

    get home_index_url

    posts = css_select('.post')
    assert_equal(10, posts.count)
  end
end
