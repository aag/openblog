require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    Post.new(title: 'Test Post', body: 'Test Body', published_at: DateTime.current)

    get home_index_url
    assert_response :success
  end

  test 'should display published posts on the index page' do
    6.times do |i|
      Post.create(title: "Post Number #{i}", body: "Body ##{i}", published_at: DateTime.current)
    end

    get home_index_url

    posts = css_select('.post')
    assert_equal(6, posts.count)
  end

  test 'should display a maximum of 10 posts on the index page' do
    11.times do |i|
      Post.create(title: "Post Number #{i}", body: "Body ##{i}", published_at: DateTime.current)
    end

    get home_index_url

    posts = css_select('.post')
    assert_equal(10, posts.count)
  end
end
